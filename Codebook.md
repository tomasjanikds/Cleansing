## CodeBook

This code book describes the variables, the data and any transformations or work that was performed to clean up the data.

### Data source
The data was collected from the accelerometers from the Samsung Galaxy S smartphone. The below links contain full description of the data (a) and data for the project (b):
a)	[The Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
b)	[The Project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR20Dataset.zip)

*Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws*

## Data and description of variables
### Data set information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Attributes:
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent:
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Note that features are normalized and bounded within [-1,1] and each feature vector is a row on the text file.

### Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Transformations and work performed
One R script called `run_analysis.R` was created to do the following:
1. To merge the training and tests sets to create one data set:
    + Data was downloaded from the data source referenced in the Data source section above
    + Downloaded data files were stored into data folder in working directory
    + Downloaded data files were unzipped into the **UCI HAR Dataset folder**
    + Two data files _Train_ and _Test_ for **activities** (Y), **subject** (subject) and **features** (X) were loaded into new six variables
    + Train and Test data files were merged into one data set for activities, subject and features respectively and three data sets `dataActivity`, `dataSubject`, `dataFeatures` were created as a result
    + The column in `dataSubject` was renamed to **subject** instead of **V1**
    + The column in `dataActivity` was renamed to **activity** instead of **V1**
    + Labels for features (*features.txt* file) were read and subsequently, the columns in `dataFeatures` were accordingly renamed
    + All three datasets `dataSubject`, `dataActivity` and `dataFeatures` were merged into one dataset named `Data`

2.	To extract only the measurements on the mean and standard deviation for each measurement
    + Regular expression pattern was used to select features that include only mean (**mean()**) and standard deviation (**std()**), examples: tBodyAcc-mean()-X and tBodyAcc-std()-X
    + Features that include only the word mean with no open and closed parentheses were excluded, examples: fBodyBodyGyroJerkMag-meanFreq() and angle(tBodyAccJerkMean),gravityMean)

3.	To use descriptive activity names to name the activities in the data set
    + Activity names (*activity_labels.txt* file) was loaded
    + In the `Data` dataset, the column `activity` was factorised and labelled as per *activity_labels.txt* file

4.	To appropriately label the data set with descriptive variable names
    + In `Data`, the following transformations have been done to rename the variable names:
        - prefix 't' was replaced with 'time'
        - prefix 'f' was replaced with 'frequency'
        - 'Acc' was replaced with 'Accelerometer'
        - 'Gyro' was replaced with 'Gyroscope'
        - 'Mag' was replaced with 'Magnitude'
        - 'BodyBody' was replaced with 'Body'

5.	To create a second, independent tidy data set from the data set in previous step (step 4). The new data set will contain the average of each variable for each activity and each subject.
    + In Data dataset from previous step, data was grouped by subject and activity.
    + Mean function has been applied on all of the measurements 
    + The output is stored in the file tidydata.csv


### Reference: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.