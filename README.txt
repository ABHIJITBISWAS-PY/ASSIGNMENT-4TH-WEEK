This repo was created as per instructed in the week 4 assignment of Cleaning Data Coursera course.

First, download and unzip the data file into your R working directory.
Second, download the R source code into your R working directory.
Finally, execute R source code to generate tidy data file.

Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

Code explaination
The code combined training dataset and test dataset, and extracted mean and standard deviation 
variables to create another dataset with the averages of each variable for each activity.

New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. 
Each row of the dataset is an average of each activity type for all subjects.

1. Merges the training and the test sets to create one data set. after read the data using read.table() ,those data was merged using 
rbind() and store it to new variable.
2.Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column 
indexes for variable name contains "mean()" or "std()" 
3. Uses descriptive activity names to name the activities in the 
data set Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
By using dplyr package first grouped the data by activity and then subsymbol, after that summarise the data on the basis of mean.