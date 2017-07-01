## The Purpose
The R script called `run_analysis.R` download the necessary data, merges individual data sets collected during the Human Activity Recognition experiment. Each participating person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The R Script extracts only mean and standard deviation for each measurement and appropriately labels the data with descriptive variable names. The script also creates a second tidy data set that is independent and contains average of each variable for each activity and each subject.
For individual steps taken, please refer to `Codebook.md`

### Data description:
[Human Activity Recogniciton Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data source:
[Project Files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Reference: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.