This is for Coursera final project for getting and cleaning data.

The R script called run_analysis.R does the following. 

1.Download the dataset if it does not already exist in the working directory.The dataset contains test set and train set.
2.Loads train/X_train.txt which contains all the meseaurements.
3.Assigns the variable names from features.txt
4.Loads the subjects from train/subject_train.txt
5.Loads activity Id for each measurement from train/y_train.txt

6.Loads test/X_test.txt which contains all the meseaurements.
7.Assigns the variable names from features.txt
8.Loads the subjects from test/subject_test.txt
9.Loads activity Id for each measurement from test/y_test.txt

10.Creates final dataset merging the training and the test set to create one data set.
11.Extracts only the measurements on the mean and standard deviation for each measurement. 
12.Assigns descriptive activity name to name the activities in the data set
13.Creates dataset with average of each variable for each activity and each subject.

The final reasult is tidydata.txt which consistis of subject,activityname and average of measurements for each subject and activity
