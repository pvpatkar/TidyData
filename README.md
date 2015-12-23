# TidyData
coursera project - getting and cleaning data

This script runs when the run_analysis.R file is sourced in R
It reads the raw data collected from the accelerometers of Samsung Galaxy S Smartphone and performs certain operation to convert it into a tidy data set.

************** CODEBOOK ***********

Subject Id refers to 30 volunteers within an age bracket of 19-48 years who have conducted the experiment

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The series of steps performed on the raw data set to achieve the end result is as below

Step 1 - Read the individual data sets from the files on disk
 ---> Read feature measurements from files (i.e. ./test/X_test.txt and ./train/X_train.txt) 
 ---> Read "test" and "train" activity identifiers from files (./test/y_test.txt and ./train/y_train.txt)
 ---> Read "test" and "train" subjects from files (./test/subject_test.txt and ./train/subject_train.txt)
 ---> read "features" and "activity labels" from files (./features.txt and ./activity_labels.txt)

Step 2 - Prepare combined data set (training and testing) i.e. bind the rows of test and train datasets


Step 3 - Prepare subset of the original combined raw data set
 ----> This subset includes only those measurement variables which contain either mean or standard deviation (std) in their names

Step 4 - Replace the numeric codes for activity with the corresponding alphabetic value from "./activity_labels.txt"

Step 5 - Modify the original variable names (column names) to include descriptive names from "./features.txt"

Step 6 - Prepare separate tidy data set containing observations consisting of study participants, activities, and a computed average for each of the measurement variables.
 ---> Add "Subject" and "Activity" variables to the dataset
 ---> Gather all feature related variables and add a new variables "feature" and "measurements"
 ---> Group the dataset by variables "Subject", "Activity" and "feature"
 ---> Summarize the dataset by providing average value of the feature measurements for subject-activity combination

**************MEASUREMENT UNITS*************

 ---> The acceleration is measured by the smartphone accelerometer in standard gravity units 'g'. 
 ---> The angular velocity is measured by the gyroscope in units radians/second. 


