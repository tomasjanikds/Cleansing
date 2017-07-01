# load necessary libraries
library(tidyverse)

# Download the data and place them into 'data' folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

# unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# get the file names
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

# assing the files to variables for processing
# Activity
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE, stringsAsFactors = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE, stringsAsFactors = FALSE)

# Subject
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE, stringsAsFactors = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE, stringsAsFactors = FALSE)

# Features
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE, stringsAsFactors = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE, stringsAsFactors = FALSE)

# Merge the Train and Test data sets
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# Give the variables sensible names
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")

# get the features names
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE, stringsAsFactors = FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

# Merge all three data sets into one
Data <- cbind(dataSubject, dataActivity, dataFeatures)

# Extracts only the measurements on the mean and standard deviation 
# for each measurement
extract_features <- c(grep("mean\\(\\)|std\\(\\)", names(Data)))
Data <- subset(Data, select = c(subject, activity, extract_features))

# Uses descriptive activity names to name the activities in the data set

# read in the Labels
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE, stringsAsFactors = FALSE)
Data$activity <- factor(Data$activity, labels = activityLabels$V2)

# Appropriately labels the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# Creates a second, independent tidy data set
Data2 <- Data %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean)) %>%
    as.data.frame()

# Export the results of the tidy data set to the csv file
write.table(Data2, file = "tidydata.txt",row.name=FALSE)