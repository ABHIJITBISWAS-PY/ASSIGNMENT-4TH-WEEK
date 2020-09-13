library("data.table")
library("dplyr")

# READ ALL THE DATA
setwd("E:/UCI HAR Dataset/test")
xtest <- read.table("X_test.txt")
ytest <- read.table("Y_test.txt")
subtest <- read.table("subject_test.txt")
setwd("E:/UCI HAR Dataset/train")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("Y_train.txt")
subtrain <- read.table("subject_train.txt")
setwd("E:/UCI HAR Dataset")
feature <- read.table("features.txt")
setwd("E:/UCI HAR Dataset")
activity <- read.table("activity_labels.txt")

suball <- rbind(subtest,subtrain)

# 1 Merges the training and the test sets to create one data set.
xall <- rbind(xtest,xtrain)
yall <- rbind(ytest,ytrain)

# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
select <- feature[grep("mean\\(\\)|std\\(\\)",feature[,2]),]
xall <- xall[,select[,1]]

# 4 Appropriately labels the data set with descriptive variable names.
colnames(xall) <- feature[select[,1],2]

# 3 Uses descriptive activity names to name the activities in the data set
yall$V1 <- factor(yall$V1, labels = activity[activity[,1],2])
colnames(yall) <- "activitylabels"

# 5 From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
colnames(suball) <- "subsymbol"
Allt <- cbind(xall,yall,suball)
allt_avg <- Allt %>%
            group_by(activitylabels,subsymbol)%>%
            summarise_each(funs (mean))
setwd("E:/UCI HAR Dataset")
write.table(allt_avg, file = "tidydata.txt", 
            row.names = FALSE, col.names = TRUE)
