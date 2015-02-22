# GetData-011_project
Course Project Repo for Coursera class: GetData-011
===========

Use the run\_analysis.R to create a tidy dataset based on provided data. The data
is from experiments of human activity measured by a smartphone (Samsung Galaxy S II)
on the waist of participants. Read more about the orginal study here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script run\_analysis.R requires the _plyr_ R package in order to run.  The script
will look for a directory in the working directory named _UCI HAR Dataset_.  If
not found, then the data will be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zip file will be unzipped in working directory, and transformed.  Please note,
the data files are almost 300MB in size.  Ensure you have the memory to load into
R.

In order to save loadtime, the script will look for an object in the R environment
named _activitiesRef_.  If it does not exist, it will load the needed data files.
If you wish to reset the data loaded, then remove the activitiesRef object from
the environment with the command:

rm(activitiesRef)

The transformations completed are as follows completed using the run_analysis.R:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each
   measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with
   the average of each variable for each activity and each subject.

After the script is run, the file "tidyData.txt" will be written to the working
directory.  It is a CSV file.

