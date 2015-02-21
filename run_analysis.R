### run_analysis.R : download, merge, clean, export  dataset from UCI HAR dataset ### 


# Download zip file if not done already
if (!file.exists('ucihar-data.zip')) {
    download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                         'getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'),
                  method='curl', destfile='ucihar-data.zip')
    unzip('ucihar-data.zip')
}

# This datasets contain data from Subjects who execute Activities, each Activity is executed N times, and it produces 128 measures of three types:

# body_acc
# body_gyro
# total_acc 

# There are two groups, Train and Test

# Note: I define here 1 observation = 1 row , even if it is composed by 128 samples (just a matter of interpretation)
# Remember, 1 observation is 1 subject who does 1 activity (of a certain type), during which 128 samples of each type (body_acc,body_gyro,total_acc) is collected for all three axis
# So 1 observation of each type (composed by 128 samples) is made of 128x3 = 384 samples

# Moreover this dataset contains a set of 561 precalculated functions for each observation(X_test.txt and X_train.txt)
# this precalculated functions are group functions which apply on all the 128x3 samples of each observation

# The assignment asks moreover to apply a further group function on (student, type of activity) groups

# Files in the zip

# activity_labels.txt
# features_info.txt
# features.txt
# README.txt

# test/subject_test.txt
# test/X_test.txt
# test/y_test.txt
# test/body_acc_x_test.txt
# test/body_acc_y_test.txt
# test/body_acc_z_test.txt
# test/body_gyro_x_test.txt
# test/body_gyro_y_test.txt
# test/body_gyro_z_test.txt
# test/total_acc_x_test.txt
# test/total_acc_y_test.txt
# test/total_acc_z_test.txt

# train/subject_train.txt
# train/X_train.txt
# train/y_train.txt
# train/body_acc_x_train.txt
# train/body_acc_y_train.txt
# train/body_acc_z_train.txt
# train/body_gyro_x_train.txt
# train/body_gyro_y_train.txt
# train/body_gyro_z_train.txt
# train/total_acc_x_train.txt
# train/total_acc_y_train.txt
# train/total_acc_z_train.txt


# cd into the directory with data
setwd('UCI HAR Dataset')

# Get activity labels for later
activity_labels <- read.csv('activity_labels.txt',sep="",header=FALSE)

# Get all function names and then filter only the wanted ones, also create a vector of indexes of such function name
fx_names <- read.table("features.txt", header=F, as.is=T, col.names=c("FeatureID", "FeatureName"))
req_fx_ids <- grep(".*mean\\(\\)|.*std\\(\\)", fx_names$FeatureName)

# Adjusted index, in my final dataset(functions) I have 2 columns before, subject_id and activity_id, so I shift the indexes right of two positions
adj_req_fx_ids = req_fx_ids + 2

#Cleaning up names, some characters create problems if used as column identifiers.
fx_names[,2] = gsub('-mean', 'Mean', fx_names[,2])
fx_names[,2] = gsub('-std', 'Std', fx_names[,2])
fx_names[,2] = gsub('[-()]', '', fx_names[,2])

#Let's give more meaningful names to columns
fx_names[,2] = gsub("^t", "time", fx_names[,2])
fx_names[,2] = gsub("^f", "frequency", fx_names[,2])
fx_names[,2] = gsub("Acc", "Accelerometer", fx_names[,2])
fx_names[,2] = gsub("Gyro", "Gyroscope", fx_names[,2])
fx_names[,2] = gsub("Mag", "Magnitude", fx_names[,2])
fx_names[,2] = gsub("BodyBody", "Body", fx_names[,2])


## NOTE: I have the code to read all data already, even if only the part of the functions is used. (ready for future assignments!)

## TEST BLOCK ##


#Read the records containing the subjects, the activity, and the pre-calculated function values, 
subject_test.txt <- read.csv('test/subject_test.txt',sep="",header=FALSE)
X_test.txt <- read.csv('test/X_test.txt',sep="",header=FALSE)
y_test.txt <- read.csv('test/y_test.txt',sep="",header=FALSE)

#This is the dataframe containing the precalculated functions. 1st column = Subject ID, 2nd column = Activity ID, 3 column (a set of 561 values) is all the functions precalculated for this observation(aka row, or record, or line)
functions.test=as.data.frame(cbind(subject_test.txt,y_test.txt,X_test.txt))


# not needed now, ready for the future!
if(FALSE) {

#Read single axis data and Column binding X,Y,X samples, x=1-128, y=129-256, x=257-384
body_gyro_x_test.txt <- read.csv('./test/Inertial Signals/body_gyro_x_test.txt',sep="",header=FALSE)
body_gyro_y_test.txt <- read.csv('./test/Inertial Signals/body_gyro_y_test.txt',sep="",header=FALSE)
body_gyro_z_test.txt <- read.csv('./test/Inertial Signals/body_gyro_z_test.txt',sep="",header=FALSE)
body_gyro.test <- as.data.frame(cbind(body_gyro_x_test.txt,body_gyro_y_test.txt,body_gyro_z_test.txt))

#Read single axis data and Column binding X,Y,X samples, x=1-128, y=129-256, x=257-384
body_acc_x_test.txt <- read.csv('./test/Inertial Signals/body_acc_x_test.txt',sep="",header=FALSE)
body_acc_y_test.txt <- read.csv('./test/Inertial Signals/body_acc_y_test.txt',sep="",header=FALSE)
body_acc_z_test.txt <- read.csv('./test/Inertial Signals/body_acc_z_test.txt',sep="",header=FALSE)
body_acc.test <- as.data.frame(cbind(body_acc_x_test.txt,body_acc_y_test.txt,body_acc_z_test.txt))


#Read single axis data and Column binding X,Y,X samples, x=1-128, y=129-256, x=257-384
total_acc_x_test.txt <- read.csv('./test/Inertial Signals/total_acc_x_test.txt',sep="",header=FALSE)
total_acc_y_test.txt <- read.csv('./test/Inertial Signals/total_acc_y_test.txt',sep="",header=FALSE)
total_acc_z_test.txt <- read.csv('./test/Inertial Signals/total_acc_z_test.txt',sep="",header=FALSE)
total_acc.test <- as.data.frame(cbind(total_acc_x_test.txt,total_acc_y_test.txt,total_acc_z_test.txt))

}

## TRAIN BLOCK ##


#Read the records containing the subjects, the activity, and the pre-calculated function values, 
subject_train.txt <- read.csv('train/subject_train.txt',sep="",header=FALSE)
X_train.txt <- read.csv('train/X_train.txt',sep="",header=FALSE)
y_train.txt <- read.csv('train/y_train.txt',sep="",header=FALSE)

#This is the dataframe containing the precalculated functions. 1st column = Subject ID, 2nd column = Activity ID, 3 column (a set of 561 values) is all the functions precalculated for this observation(aka row, or record, or line)
functions.train=as.data.frame(cbind(subject_train.txt,y_train.txt,X_train.txt))


# not needed now, ready for the future!
if(FALSE) {

#Read single axis data and Column binding X,Y,X samples, x=1-128, y=129-256, x=257-384
body_gyro_x_train.txt <- read.csv('./train/Inertial Signals/body_gyro_x_train.txt',sep="",header=FALSE)
body_gyro_y_train.txt <- read.csv('./train/Inertial Signals/body_gyro_y_train.txt',sep="",header=FALSE)
body_gyro_z_train.txt <- read.csv('./train/Inertial Signals/body_gyro_z_train.txt',sep="",header=FALSE)
body_gyro.train <- as.data.frame(cbind(body_gyro_x_train.txt,body_gyro_y_train.txt,body_gyro_z_train.txt))

#Read single axis data and Column binding X,Y,X samples, x=1-128, y=129-256, x=257-384
body_acc_x_train.txt <- read.csv('./train/Inertial Signals/body_acc_x_train.txt',sep="",header=FALSE)
body_acc_y_train.txt <- read.csv('./train/Inertial Signals/body_acc_y_train.txt',sep="",header=FALSE)
body_acc_z_train.txt <- read.csv('./train/Inertial Signals/body_acc_z_train.txt',sep="",header=FALSE)
body_acc.train <- as.data.frame(cbind(body_acc_x_train.txt,body_acc_y_train.txt,body_acc_z_train.txt))

#Read single axis data and Column binding X,Y,X samples, x=1-128, y=129-256, x=257-384
total_acc_x_train.txt <- read.csv('./train/Inertial Signals/total_acc_x_train.txt',sep="",header=FALSE)
total_acc_y_train.txt <- read.csv('./train/Inertial Signals/total_acc_y_train.txt',sep="",header=FALSE)
total_acc_z_train.txt <- read.csv('./train/Inertial Signals/total_acc_z_train.txt',sep="",header=FALSE)
total_acc.train <- as.data.frame(cbind(total_acc_x_train.txt,total_acc_y_train.txt,total_acc_z_train.txt))
}


## MERGING TEST+TRAIN BLOCK ##


#Merging Test and Train data by Row Binding the Data Frames

# not needed now, ready for the future!
if(FALSE) {
body_gyro=rbind(body_gyro.test,body_gyro.train)
body_acc=rbind(body_acc.test,body_acc.train)
total_acc=rbind(total_acc.test,total_acc.train)
}

functions=rbind(functions.test,functions.train)



#Taking only the needed columns
fx=functions[,c(1,2,adj_req_fx_ids)]

# Assigning names to columns
names(fx)=c('subject_id','activity_id',fx_names[req_fx_ids,2])

#Replace id with labels for activity type
fx$activity_id <- factor(fx$activity_id,levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

# Now let's get powered by dplyr
library(dplyr)

# Calculate the means for each variable in each group. Why this? it corresponds to the average of the measures for one subject for one type of activity, like, WALKING (each activity is executed by each subjet multiple times)

# Group by subject and activity
fx_tidy <- fx %>% group_by(subject_id,activity_id) %>% summarise_each(funs(mean))

# Output tidy dataset
write.table(fx_tidy, 'tidy_data.txt',row.name=FALSE )

setwd('..')



