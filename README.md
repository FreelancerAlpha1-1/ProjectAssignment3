ProjectAssignment3
==================

Repository for Coursera course Getting and Cleaning Data.
In this repository are the following files:
- README.md: Gives information R code used in this repository
- CodeBook.md: Codebook for run_analysis.R
- run_analysis.R: Execution file for the R-code.

Prerequisites for running run_analysis.R.
- R-studio installed
- Extract the zip-file for Coursera project Getting and Cleaning Data in your working directory. Zip file is peerass.zip. Make sure that the root directory ("UCI HAR Dataset") is in your working directory.
- Saved run_analysis.R to your working directory 
- Installed the 'plyr' package

Files used:
- UCI HAR Dataset/test/X_test.txt: Measured data for test set
- UCI HAR Dataset/test/Y_test.txt: Activity-code of the measured data for test set
- UCI HAR Dataset/test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- UCI HAR Dataset/train/X_train.txt: Measured data for training set
- UCI HAR Dataset/train/Y_train.txt: Activity-code of the measured data for train set
- UCI HAR Dataset/train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- UCI HAR Dataset/features.txt: List of all features
- UCI HAR Dataset/activity_labels.txt: Links the class labels with their activity name.

Output:
These code runs an analysis on data of accelerometers from the Samsung Galaxy S smartphone. The output
is a tidy data set with the average of each variable for each activity and each subject. The dataset is saved in the file AveragesByActivityAndSubject.txt within directory 'UCI HAR Dataset'

Notes:
- Combine test and train data

We have 2 datasets which we need to combine (test and train). Before we can combine them to 1 dataset, we need to complete both datasets first. The labels for the variables and the activity plus the subject of each observation is stored in a seperate file. Which files you can see above.

To combine different datasets, we used the merge function. Therefor we don't need another package and for these datasets the merge-function performs well. 

- Filter measurements

For this assignment we only need the measurements on the mean and standard deviation. Only the measurements with mean() or std() at the END of the name are selected. The other measurements are filtered out. The filter checks if the column has 'mean()' or 'std()' in his name. Also the columns 'ActivityName' and 'Subject' are selected because we need them later on. 

- Rename label of the measurements

The labels of the measurements are given more friendly names. The letter 'f' at the beginning of the label is changed to 'Time' and 'f' is changed to 'Freq' (frequency)

- Create tidy dataset (output)

Then we want the average of each variable for each activity and each subject. With ddply we needed just 1 line of code. For this function you need the 'plyr' package. This outcome is saved to a file AveragesByActivityAndSubject.txt within directory 'UCI HAR Dataset'. The ouput is tab-delimited.

Executing the code can be done with the following command: source('run_analysis.R')


Data in test set and training set are combined to one dataset

