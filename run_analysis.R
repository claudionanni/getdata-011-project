if (!file.exists('ucihar-data.zip')) {
    download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                         'getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'),
                  method='curl', destfile='ucihar-data.zip')
    unzip('ucihar-data.zip')
}


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

#cat k | awk '{print $2}' | awk -F"/" '{print $2" <- read.csv(\x27"$1"/"$2"\x27)"}'
#find . -name '*' | egrep "Inertial" | awk -F"/" '{print $4" <- read.csv(\x27"$0"\x27)"}'

setwd('UCI HAR Dataset')


activity_labels <- read.csv('activity_labels.txt',sep="",header=FALSE)

fx_names <- read.table("features.txt", header=F, as.is=T, col.names=c("FeatureID", "FeatureName"))
req_fx_ids <- grep(".*mean\\(\\)|.*std\\(\\)", function_names$FeatureName)
adj_req_fx_ids = req_fx_ids + 2

## TEST BLOCK ##

#Read the records containing the subjects, the activity, and the pre-calculated function values, 
subject_test.txt <- read.csv('test/subject_test.txt',sep="",header=FALSE)
X_test.txt <- read.csv('test/X_test.txt',sep="",header=FALSE)
y_test.txt <- read.csv('test/y_test.txt',sep="",header=FALSE)

#This is the dataframe containing the precalculated functions. 1st column = Subject ID, 2nd column = Activity ID, 3 column (a set of 561 values) is all the functions precalculated for this observation(aka row, or record, or line)
functions.test=as.data.frame(cbind(subject_test.txt,y_test.txt,X_test.txt))


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



## TRAIN BLOCK ##


#Read the records containing the subjects, the activity, and the pre-calculated function values, 
subject_train.txt <- read.csv('train/subject_train.txt',sep="",header=FALSE)
X_train.txt <- read.csv('train/X_train.txt',sep="",header=FALSE)
y_train.txt <- read.csv('train/y_train.txt',sep="",header=FALSE)

#This is the dataframe containing the precalculated functions. 1st column = Subject ID, 2nd column = Activity ID, 3 column (a set of 561 values) is all the functions precalculated for this observation(aka row, or record, or line)
functions.train=as.data.frame(cbind(subject_train.txt,y_train.txt,X_train.txt))


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



## MERGING TEST+TRAIN BLOCK ##


#Merging Test and Train data by Row Binding the Data Frames

body_gyro=rbind(body_gyro.test,body_gyro.train)

body_acc=rbind(body_acc.test,body_acc.train)

total_acc=rbind(total_acc.test,total_acc.train)

functions=rbind(functions.test,functions.train)



# Note columns are shifted +2 on the right, so all values need +2

# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 4 tBodyAcc-std()-X
# 5 tBodyAcc-std()-Y
# 6 tBodyAcc-std()-Z
# 121 tBodyGyro-mean()-X
# 122 tBodyGyro-mean()-Y
# 123 tBodyGyro-mean()-Z
# 124 tBodyGyro-std()-X
# 125 tBodyGyro-std()-Y
# 126 tBodyGyro-std()-Z




fx=functions[,c(1,2,adj_req_fx_ids)]

# Assigning names to columns
# Assigning names to columns
# Assigning names to columns


names(fx)=c('subject_id','activity_id',fx_names[req_fx_ids,2])


#Adding a column with descriptive names of activities
fx$activity_name <- factor(fx$activity_id,levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

library(dplyr)

# Group by subject and activity
#fx_grouped <- group_by(fx, subject_id,activity_id)

# Calculate the means for each variable in each group. Why this? it corresponds to the average of the measures for one subject for one type of activity, like, WALKING (each activity is executed by each subjet multiple times)

fx_tidy <- fx %>% group_by(subject_id,activity_id) %>% summarise_each(funs(mean))
fx_tidy$activity_name <- factor(fx_tidy$activity_id,levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

write.table(fx_tidy, 'tidy_data.txt')

setwd('..')



