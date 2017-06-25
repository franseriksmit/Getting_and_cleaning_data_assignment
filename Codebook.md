## Codebook Getting and cleaning data Assignment4

Getting and Cleaning Data Project

Frans Smit

Description

Data set information and transformations used in the course project for Coursera Getting and Cleaning Data course.

Source Data

Human Activity Recognition Using Smartphones Dataset V1

Section 1 - Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The following files are provided but not used:
'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


Notes:

Features are normalized and bounded within [-1,1].
Each feature vector is a row on the text file.
For more information about this dataset contact: activityrecognition@smartlab.ws

License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Section 2 - Transformations:

1.Download unzip the data

2.Load UCI HAR Dataset/activity_labels.txt into actLabel WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

Load measurements from UCI HAR Dataset/features.txt into features. 
2.Get selected features from featuresv into Columnswanted.names. These are:tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX tBodyAccStdY tBodyAccStdZ tGravityAccMeanX tGravityAccMeanY tGravityAccMeanZ tGravityAccStdX tGravityAccStdY tGravityAccStdZ tBodyAccJerkMeanX tBodyAccJerkMeanY tBodyAccJerkMeanZ tBodyAccJerkStdX tBodyAccJerkStdY tBodyAccJerkStdZ tBodyGyroMeanX tBodyGyroMeanY tBodyGyroMeanZ tBodyGyroStdX tBodyGyroStdY tBodyGyroStdZ tBodyGyroJerkMeanX tBodyGyroJerkMeanY tBodyGyroJerkMeanZ tBodyGyroJerkStdX tBodyGyroJerkStdY tBodyGyroJerkStdZ tBodyAccMagMean tBodyAccMagStd tGravityAccMagMean tGravityAccMagStd tBodyAccJerkMagMean tBodyAccJerkMagStd tBodyGyroMagMean tBodyGyroMagStd tBodyGyroJerkMagMean tBodyGyroJerkMagStd fBodyAccMeanX fBodyAccMeanY fBodyAccMeanZ fBodyAccStdX fBodyAccStdY fBodyAccStdZ fBodyAccMeanFreqX fBodyAccMeanFreqY fBodyAccMeanFreqZ fBodyAccJerkMeanX fBodyAccJerkMeanY fBodyAccJerkMeanZ fBodyAccJerkStdX fBodyAccJerkStdY fBodyAccJerkStdZ fBodyAccJerkMeanFreqX fBodyAccJerkMeanFreqY fBodyAccJerkMeanFreqZ fBodyGyroMeanX fBodyGyroMeanY fBodyGyroMeanZ fBodyGyroStdX fBodyGyroStdY fBodyGyroStdZ fBodyGyroMeanFreqX fBodyGyroMeanFreqY fBodyGyroMeanFreqZ fBodyAccMagMean fBodyAccMagStd fBodyAccMagMeanFreq fBodyBodyAccJerkMagMean fBodyBodyAccJerkMagStd fBodyBodyAccJerkMagMeanFreq fBodyBodyGyroMagMean fBodyBodyGyroMagStd fBodyBodyGyroMagMeanFreq fBodyBodyGyroJerkMagMean fBodyBodyGyroJerkMagStd fBodyBodyGyroJerkMagMeanFreq.

4.Load UCI HAR Dataset/train/Y_train.txt" into trainact 
5.Load UCI HAR Dataset/train/subject_train.txt" into trainsub 
6.Load UCI HAR Dataset/train/x_train.txt" into train. Select from train columns in Columnswanted.names. Combine columns trainsub, trainact and train into train.

7.Load UCI HAR Dataset/test/Y_test.txt into testact. 
8.Load UCI HAR Dataset/test/subject_test.txt into testsub. 
9.Load UCI HAR Dataset/train/X_test.txt" into test. Select from test columns in Columnswanted.names. Combine columns testsub, testact and test into test.
10.Merge train and test into Samen and add appropriate labels 
11.Turn activities and subjects into factors 
12.Creates an independent tidy data set with the average of each variable for each activity and each subject.

Result: tidy data set, named tidy.txt