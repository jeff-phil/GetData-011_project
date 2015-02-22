library(plyr)

# Instructions for GetData-011 Course Project:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with
#    the average of each variable for each activity and each subject.

# Load the data
#
# Simple caching, look if activitiesRef exists if not reload the data.
# Can reset loaded data by running the command:
#      rm(activitiesRef)
if (!exists("activitiesRef")) {
        
        # Download, and unzip the file if not present - Remove the zip to save space
        if (!file.exists("UCI HAR Dataset")) {
                dataset <- "dataset.zip"
                download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                              destfile = dataset, method = "curl")
                unzip(dataset)
                file.remove(dataset)
        }
        
        # These will be scoped back to the parent environment
        activitiesRef   <<- read.table("UCI HAR Dataset/activity_labels.txt")
        featuresRef     <<- read.table("UCI HAR Dataset/features.txt")
        testX           <<- read.table("UCI HAR Dataset/test/X_test.txt")
        testY           <<- read.table("UCI HAR Dataset/test/y_test.txt")
        testSubject     <<- read.table("UCI HAR Dataset/test/subject_test.txt")
        trainX          <<- read.table("UCI HAR Dataset/train/X_train.txt")
        trainY          <<- read.table("UCI HAR Dataset/train/y_train.txt")
        trainSubject    <<- read.table("UCI HAR Dataset/train/subject_train.txt")
}

# Set the columnnames initially by Feature and Activity data
colnames(featuresRef) <- c("columnId", "columnName")
colnames(testX) <- featuresRef[, "columnName"]
colnames(trainX) <- featuresRef[, "columnName"]
colnames(activitiesRef) <- c("ActivityId", "Activity")


## 2. Extracts only the measurements on the mean and standard deviation for each
## ============================================================================
## Note: I did 2 & 4 first, instead of combining data first, to save memory
##       so that was only combining all data for just mean and std data
#
# Find all the columns with mean() or std(), replace with Mean and Std, and
# take out hyphens and parens
meanAndStdColumns <- featuresRef[grep("(mean|std)\\(\\)", featuresRef$columnName), ]
meanAndStdColumns$columnName <- sub("mean\\(\\)", "Mean", meanAndStdColumns$columnName)
meanAndStdColumns$columnName <- sub("std\\(\\)", "Std", meanAndStdColumns$columnName)
meanAndStdColumns$columnName <- gsub("-", "", meanAndStdColumns$columnName)

## 4. Appropriately labels the data set with descriptive variable names. 
## =====================================================================
#
# Create subset of Test X and Train X data with just the Mean and Std columns
# of interest matched above from Features file.  Apply the cleaned up colnames.
sTest <- testX[ , meanAndStdColumns$columnId]
colnames(sTest) <- meanAndStdColumns[,"columnName"]
sTrain <- trainX[ , meanAndStdColumns$columnId]
colnames(sTrain) <- meanAndStdColumns[,"columnName"]

# Assign better column names to Subject and Y files
colnames(trainSubject) <- "SubjectId"
colnames(testSubject) <- "SubjectId"
colnames(trainY) <- "ActivityId"
colnames(testY) <- "ActivityId"

## 1. Merges the training and the test sets to create one data set.
## ================================================================
#
# Combine the Subject, Y and X files for both Test and Train
sTest <- cbind(testSubject, testY, sTest)
sTrain <- cbind(trainSubject, trainY, sTrain)

# Now combine All Test and Train Data with wanted Mean and Std, Subject and Act
allData <- rbind(sTest, sTrain)

## 3. Uses descriptive activity names to name the activities in the data set
## =========================================================================
#
# Merge in the connected Activity Labels from Activity file, then remove
# ActivityId field, and lastly reorder cols: SubjectId, Activity, and measurements
allData <- merge(activitiesRef, allData, by=c("ActivityId"))
allData <- allData[ , -(1)]
allData <- allData[ , c(2, 1, 3:68)]

## 5. From the data set in step 4, creates a second, independent tidy data set...
## =========================================================================
#
# Create the final step of summarizing measurements over Subject and Activity
tidyData <- ddply(allData, .(SubjectId, Activity), function(x) colMeans(x[, 3:68]))

# Write tidyData to file
write.table(tidyData, "tidyData.csv", sep = ",", col.names = TRUE, row.names = FALSE)


