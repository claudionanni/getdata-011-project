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


#At this point we miss the descriptive names of the activities in the second column of the data.frame

#Also, we need to take only some of the columns :

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


fx=functions[,c(1,2,3,4,5,6,7,8,123,124,125,126,127,128)]

names(fx)=c('subject_id','activity_id','tBodyAcc-mean()-X', 'tBodyAcc-mean()-Y', 'tBodyAcc-mean()-Z', 'tBodyAcc-std()-X', 'tBodyAcc-std()-Y', 'tBodyAcc-std()-Z', 'tBodyGyro-mean()-X', 'tBodyGyro-mean()-Y', 'tBodyGyro-mean()-Z', 'tBodyGyro-std()-X', 'tBodyGyro-std()-Y', 'tBodyGyro-std()-Z')

fx$activity_name <- factor(fx$activity_id,levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

setwd('..')



