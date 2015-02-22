---
title: "Coursera GetData-011 Project CodeBook"
author: "https://github.com/jeff-phil/"
date: "February 22, 2015"
output: html_document
---
# Summary
This is the codebook for the Coursera GetData-011 data science course.  The data
is from experiments of human activity measured by a smartphone (Samsung Galaxy S II)
on the waist of participants.

Read more about the orginal study here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Original Data
The data for the project was obtained from this location: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In the orgininal zip file there observations for both Test and Train, with the
Subject, or volunteers, and the Activity being performed were measured.  The
Activities were:

- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALING_UPSTAIRS

Using its embedded accelerometer and gyroscope, they captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The orginal zip file dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

# New Data
The above data for Test and Train measurements were combined into a single dataset.
The single dataset only contains Mean and Standard Deviation measurements from the
orginal dataset.  Then based on this, took the Average of each of the measurements
by Subject and then by Activity.

The transformations completed are as follows completed using the run_analysis.R:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each
   measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with
   the average of each variable for each activity and each subject.

The resulting dataset has following columns:

- SubjectId - The number identifier for the human volunteer
- Activity - The readable activity label for the observation: LAYING, SITTING,
STANDING, WALKING, WALKING\_DOWNSTAIRS, WALKING\_UPSTAIRS
- ... - The Average measurement of 66 different observations.  The labels have
been set where Mean or Std in the last part indicate whether the measurement is
a Mean or Standard Deviation based on the original data having _mean()_ or _std()_
in the feature name.  

Units: Using its embedded accelerometer and gyroscope, they captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The list of measurements are (please see the features_info.txt for more detailed
discussion of measurements):

- "tBodyAccMeanX"
- "tBodyAccMeanY"
- "tBodyAccMeanZ"
- "tBodyAccStdX"
- "tBodyAccStdY"
- "tBodyAccStdZ"
- "tGravityAccMeanX"
- "tGravityAccMeanY"
- "tGravityAccMeanZ"
- "tGravityAccStdX"
- "tGravityAccStdY"
- "tGravityAccStdZ"
- "tBodyAccJerkMeanX"
- "tBodyAccJerkMeanY"
- "tBodyAccJerkMeanZ"
- "tBodyAccJerkStdX"
- "tBodyAccJerkStdY"
- "tBodyAccJerkStdZ"
- "tBodyGyroMeanX"
- "tBodyGyroMeanY"
- "tBodyGyroMeanZ"
- "tBodyGyroStdX"
- "tBodyGyroStdY"
- "tBodyGyroStdZ"
- "tBodyGyroJerkMeanX"
- "tBodyGyroJerkMeanY"
- "tBodyGyroJerkMeanZ"
- "tBodyGyroJerkStdX"
- "tBodyGyroJerkStdY"
- "tBodyGyroJerkStdZ"
- "tBodyAccMagMean"
- "tBodyAccMagStd"
- "tGravityAccMagMean"
- "tGravityAccMagStd"
- "tBodyAccJerkMagMean"
- "tBodyAccJerkMagStd"
- "tBodyGyroMagMean"
- "tBodyGyroMagStd"
- "tBodyGyroJerkMagMean"
- "tBodyGyroJerkMagStd"
- "fBodyAccMeanX"
- "fBodyAccMeanY"
- "fBodyAccMeanZ"
- "fBodyAccStdX"
- "fBodyAccStdY"
- "fBodyAccStdZ"
- "fBodyAccJerkMeanX"
- "fBodyAccJerkMeanY"
- "fBodyAccJerkMeanZ"
- "fBodyAccJerkStdX"
- "fBodyAccJerkStdY"
- "fBodyAccJerkStdZ"
- "fBodyGyroMeanX"
- "fBodyGyroMeanY"
- "fBodyGyroMeanZ"
- "fBodyGyroStdX"
- "fBodyGyroStdY"
- "fBodyGyroStdZ"
- "fBodyAccMagMean"
- "fBodyAccMagStd"
- "fBodyBodyAccJerkMagMean"
- "fBodyBodyAccJerkMagStd"
- "fBodyBodyGyroMagMean"
- "fBodyBodyGyroMagStd"
- "fBodyBodyGyroJerkMagMean"
- "fBodyBodyGyroJerkMagStd"


