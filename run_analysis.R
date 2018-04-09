library(dplyr)

##################################################################################
# STEP 1 Getting data
##################################################################################

# file url
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

# zip file destination and its name (current directory)
file.location = file.path(getwd(),'archive.zip')

# download zip file if it doesn't already exist (to avoid re-downloading)
if (!file.exists(file.location)) {
  download.file(url, file.location)
}

# unzip data if the dataset doesn't already exist (to avoid re-unzipping)
dataDir <- 'UCI HAR Dataset'
if (!file.exists(dataDir)) {
  unzip(file.location)
}

##################################################################################
# STEP 2 Reading data
##################################################################################

# reading test set
x_test <- read.table(unzip(file.location, 
                'UCI HAR Dataset/test/X_test.txt'))
y_test <- read.table(unzip(file.location, 
                           'UCI HAR Dataset/test/y_test.txt'))
subject_test <- read.table(unzip(file.location, 
                           'UCI HAR Dataset/test/subject_test.txt'))

# reading training set
x_train <- read.table(unzip(file.location, 
                           'UCI HAR Dataset/train/X_train.txt'))
y_train <- read.table(unzip(file.location, 
                            'UCI HAR Dataset/train/y_train.txt'))

subject_train <- read.table(unzip(file.location, 
                            'UCI HAR Dataset/train/subject_train.txt'))

# reading features
features <- read.table(unzip(file.location, 
                            'UCI HAR Dataset/features.txt'))


##################################################################################
# STEP 3 Labeling and merging data
##################################################################################

# assigning headers to test and train data

colnames(x_test) <- t(features[2]) # have to transform features with t()
colnames(x_train) <- t(features[2])


# setting activities and participants

x_test$activity <- y_test[,1]
x_test$participant <- subject_test[,1]
x_train$activity <- y_train[,1]
x_train$participant <- subject_train[,1]

# merging sets

merged <- rbind(x_test,x_train) 

##################################################################################
# STEP 4 Cleaning data
##################################################################################

# removing special charachters in column names
cols <- colnames(merged)
newcols <- gsub("[\\(\\)-]", "", cols)

# making names more descriptive

newcols <- gsub("^t", "timeDomain", newcols)
newcols <- gsub("^f", "freqDomain", newcols)
newcols <- gsub("Acc", "Accelerometer", newcols)
newcols <- gsub("std", "StanDev", newcols)
newcols <- gsub("mean", "Mean", newcols)
newcols <- gsub("Gyro", "Gyroscope", newcols)
newcols <- gsub("Freq", "Frequency", newcols)
newcols <- gsub("Mag", "Magnitude", newcols)

# reassigning columns names back to merged dataset

colnames(merged) <- newcols

# making activities decriptive and as factors

merged$activity <- factor(merged$activity, 
                                  levels = c(1,2,3,4,5,6), 
                                  labels = c('WALKING',
                                             'WALKING_UPSTAIRS',
                                             'WALKING_DOWNSTAIRS',
                                             'STANDING',
                                             'SITTING',
                                             'LAYING'))


##################################################################################
# STEP 5 Subsetting data
##################################################################################

# getting only mean values from merged dataset

newcols <- grepl("participant|activity|Mean|StanDev",
                       colnames(merged))

mergedMeansStd <- merged[, newcols] 

# creating second independent dataset for means by activity and participant

second_dataset <- mergedMeansStd %>%
  group_by(activity,participant) %>%
  summarise_all(funs(mean))

# writing tidy dataset to file
write.table(second_dataset, "tidy_dataset.txt", 
            row.names = FALSE, 
            quote = FALSE,
            sep = '\t')


