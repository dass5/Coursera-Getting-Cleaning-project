#Load the library
library(dplyr)
#Get the datasets
filename <- "Dataset.zip" 

## Download and extract the dataset: 
 if (!file.exists(filename)){ 
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", filename) 
 }   
unzip(filename)  

# Read the training data in dataframe
data=read.table("UCI HAR Dataset/train/X_train.txt")

#Get the feature to appropriately label the data set with descriptive variable names
feature=read.table("UCI HAR Dataset/features.txt")
names=feature$V2
colnames(data)<-names

#Extract the activity 
trainactivity=read.table("UCI HAR Dataset/train/y_train.txt")
colnames(trainactivity)<- c('ActivityId')

#Extract the Subject 
subjects=read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subjects)<-c("subject")

#Merge subject,activity with the training set
traindata=cbind(subjects,trainactivity,data)

# Read the test data in dataframe
data1=read.table("UCI HAR Dataset/test/X_test.txt")

#Assign the descriptive variable name from features.txt
colnames(data1)=names

#Extract the activity 
testactivity=read.table("UCI HAR Dataset/test/y_test.txt")
colnames(testactivity)<- c('ActivityId')

#Extract the Subject 
testsubjects=read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(testsubjects)<-c("subject")

#Merge subject,activity with the test set
testdata=cbind(testsubjects,testactivity,data1)

#Merge the training and test dataset
finaldata=rbind(traindata,testdata)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
finaldata_std_mean=finaldata[,c(1,2,grep("mean\\(\\)|std\\(\\)",colnames(finaldata)))]
colnames(finaldata_std_mean)

#descriptive activity names to name the activities in the data set
Activityname=read.table("UCI HAR Dataset/activity_labels.txt")
colnames(Activityname)<- c("ActivityId","Activityname")
merged_data=merge(Activityname,finaldata_std_mean,by.x ="ActivityId",by.y = "ActivityId" )

#Get rid of ActivityId variable
merged_data=merged_data[,-c(1)]

#average of each variable for each activity and each subject.
meanall=merged_data %>% group_by(subject,Activityname) %>% summarise_each(funs(mean))     

#To get meaningful variable name
meanall1=gsub("-", "",colnames(meanall))
meanall1=gsub("\\(\\)", "",meanall1)
meanall1=gsub("Acc", "Accelerometer",meanall1)
meanall1=gsub("Gyro", "Gyroscope",meanall1)
meanall1=gsub("std", "StandardDeviation",meanall1)
colnames(meanall)=meanall1

#write the final tidy dataset in a file
write.table(meanall,"tidydata.txt",row.names = FALSE,quote = FALSE)

