# getdata-011-project
Course Project of Getting and Cleaning Data (acceleration sampling of subjects with smartphone)
# Getting and Cleaning Data

## Course Project

The R script called run_analysis.R does the following


1. Downloads the dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Load all data and Merges the Training and Test sets to create one data set.
3. Extracts only the values of the aggregated functions on the mean and standard deviation for each 128 samples measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the columns with the names of the aggregate functions
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Run ```source("run_analysis.R")```,  it will download, unzip, load, merge data and generate a new file ```tidy_data.txt``` in your working directory.

## Dependencies

```run_analysis.R``` file will help you to install the dependencies automatically. It depends on ```dplyr```.
