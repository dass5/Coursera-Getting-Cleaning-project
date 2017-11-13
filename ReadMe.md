This is for Coursera final project for getting and cleaning data.
The R script called run_analysis.R does the following. 
Download the dataset if it does not already exist in the working directory.
The dataset contains test set and train set.Loads train/X_train.txt which contains all the meseaurements.
Assign the variable names from features.txtLoads the subjects from train/subject_train.txt
Loads activity Id for each measurement from train/y_train.txt
Loads test/X_test.txt which contains all the meseaurements.Assigns the variable names from features.txt
Loads the subjects from test/subject_test.txtLoads activity Id for each measurement from test/y_test.txt
Creates final dataset merging the training and the test set to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Assigns descriptive activity name to name the activities in the data setCreates dataset with average of each variable for each activity and each subject.
The final reasult is tidydata.txt which consistis of subject,activityname and average of measurements for each subject and activity
