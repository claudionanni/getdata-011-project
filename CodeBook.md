# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

- functions / aggregate functions
I use 'aggregate function' or 'function' for the data contained in the features.txt file, 
I find it more intuitive because each of the 561 value is calculated operating on all the 128 observations (made of 3 samples each, x,y,x). Also, I prefer to use 'observation' and 'measureament' only for the raw data sampled by the device.


## Variables

### subject

  * Description: The subject identifier
  * Data Type/Units: integer
  * Values:
    * 1..30: Uniquely identifies 1 of 30 volunteers aged between 19-48 years.

### activity

  * Description: 1 of 6 distinct activities during which the feature was measured
  * Data Type/Units: string
  * Values:
    * LAYING
    * SITTING
    * STANDING
    * WALKING
    * WALKING_DOWNSTAIRS
    * WALKING_UPSTAIRS

### feature

  * Description: The feature measured.  The following describes how to interpret each feature name(name were transformed to made them easy to understand)
    * Prefix:
      * time: time domain signal
      * frequency: fast fourier transformed
    * Raw signal source instrument:
      * Accelerometer: Accelerometer
      * Gyroscope: Gyroscope
        * For the Gyroscopic measure, Body and Gravity measures were separated
    * Other attributes:
      * Jerk: measures derived in time
      * Mag: Euclidean norm magnitude of Jerk signals
      * X, Y, Z: axis of the feature
      * Mean: Mean of the feature
      * Std: Standard deviation of the feature
  * Data Type/Units: string
* Values:
 * frequencyBodyAccelerometerJerkMagnitudeMean
 * frequencyBodyAccelerometerJerkMagnitudeStd
	* frequencyBodyAccelerometerJerkMeanX
	* frequencyBodyAccelerometerJerkMeanY
	* frequencyBodyAccelerometerJerkMeanZ
	* frequencyBodyAccelerometerJerkStdX
	* frequencyBodyAccelerometerJerkStdY
	* frequencyBodyAccelerometerJerkStdZ
	* frequencyBodyAccelerometerMagnitudeMean
	* frequencyBodyAccelerometerMagnitudeStd
	* frequencyBodyAccelerometerMeanX
	* frequencyBodyAccelerometerMeanY
	* frequencyBodyAccelerometerMeanZ
	* frequencyBodyAccelerometerStdX
	* frequencyBodyAccelerometerStdY
	* frequencyBodyAccelerometerStdZ
	* frequencyBodyGyroscopeJerkMagnitudeMean
	* frequencyBodyGyroscopeJerkMagnitudeStd
	* frequencyBodyGyroscopeMagnitudeMean
	* frequencyBodyGyroscopeMagnitudeStd
	* frequencyBodyGyroscopeMeanX
	* frequencyBodyGyroscopeMeanY
	* frequencyBodyGyroscopeMeanZ
	* frequencyBodyGyroscopeStdX
	* frequencyBodyGyroscopeStdY
	* frequencyBodyGyroscopeStdZ
	* timeBodyAccelerometerJerkMagnitudeMean
	* timeBodyAccelerometerJerkMagnitudeStd
	* timeBodyAccelerometerJerkMeanX
	* timeBodyAccelerometerJerkMeanY
	* timeBodyAccelerometerJerkMeanZ
	* timeBodyAccelerometerJerkStdX
	* timeBodyAccelerometerJerkStdY
	* timeBodyAccelerometerJerkStdZ
	* timeBodyAccelerometerMagnitudeMean
	* timeBodyAccelerometerMagnitudeStd
	* timeBodyAccelerometerMeanX
	* timeBodyAccelerometerMeanY
	* timeBodyAccelerometerMeanZ
	* timeBodyAccelerometerStdX
	* timeBodyAccelerometerStdY
	* timeBodyAccelerometerStdZ
	* timeBodyGyroscopeJerkMagnitudeMean
	* timeBodyGyroscopeJerkMagnitudeStd
	* timeBodyGyroscopeJerkMeanX
	* timeBodyGyroscopeJerkMeanY
	* timeBodyGyroscopeJerkMeanZ
	* timeBodyGyroscopeJerkStdX
	* timeBodyGyroscopeJerkStdY
	* timeBodyGyroscopeJerkStdZ
	* timeBodyGyroscopeMagnitudeMean
	* timeBodyGyroscopeMagnitudeStd
	* timeBodyGyroscopeMeanX
	* timeBodyGyroscopeMeanY
	* timeBodyGyroscopeMeanZ
	* timeBodyGyroscopeStdX
	* timeBodyGyroscopeStdY
	* timeBodyGyroscopeStdZ
	* timeGravityAccelerometerMagnitudeMean
	* timeGravityAccelerometerMagnitudeStd
	* timeGravityAccelerometerMeanX
	* timeGravityAccelerometerMeanY
	* timeGravityAccelerometerMeanZ
	* timeGravityAccelerometerStdX
	* timeGravityAccelerometerStdY
	* timeGravityAccelerometerStdZ

 



### average

  * Description: Mean of the given feature variable by subject and activity
  * Data Type/Units: numeric, normalized and bounded within [-1, 1]
  * Values:
    * [-1, 1]
    * 


## Transformation details

There are 6 parts:


1. The three independent files that contain Subject_id, Activity_id, and the 561 aggregate function calculations are loaded and bound together in one data frame (for both Test and Train)
2. These two data frames are merged (union) forming one data frame for a total of  2947 + 7352 = 10299 rows.
3. Only the functions on the mean and standard deviation for each measurement are selected.
3. Descriptive activity names to name the activities in the data set is used.
4. Appropriately labels the columns of with more appropriate names, also because the names in the original dataset can create problems containing invalid characters ('-','(',')').
5. A second independent tidy data set with the average of each variable for each activity and each subject is created.

## How ```run_analysis.R``` implements the above steps:

* Requires ```dplyr```.
* Load both test and train data
* Load the features and activity labels.
* Merge Train and Test datasets
* Extract the mean and standard deviation column names and data.
* Calculate averages grouping by (subject,activity)
* Output the new tidy data set.
