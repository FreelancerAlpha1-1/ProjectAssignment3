ProjectAssignment3
==================

Repository for Coursera course Getting and Cleaning Data
In this repository are the following files:
README.md: Gives information R code used in this repository
CodeBook.md: Codebook for run_analysis.R
run_analysis.R: Execution file for the R-code.

Prerequisites for running run_analysis.R
- R-studio installed
- Extract the zip-file for Coursera project Getting and Cleaning Data in your working directory. Zip file is peerass.zip. Make sure that the root directory ("UCI HAR Dataset") is in your working directory.
- Saved run_analysis.R to your working directory 

Files used:
- UCI HAR Dataset/test/X_test.txt: Measured data for test set
- UCI HAR Dataset/test/Y_test.txt: Activity-code of the measured data for test set
- UCI HAR Dataset/test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- UCI HAR Dataset/train/X_train.txt: Measured data for training set
- UCI HAR Dataset/train/Y_train.txt: Activity-code of the measured data for train set
- UCI HAR Dataset/train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- UCI HAR Dataset/features.txt: List of all features
- UCI HAR Dataset/activity_labels.txt: Links the class labels with their activity name.

Notes



Output
Tidy data set with the average of each variable for each activity and each subject.
Data in test set and training set are combined to one dataset


Executing the code can be done with the following command: source('run_analysis.R')

