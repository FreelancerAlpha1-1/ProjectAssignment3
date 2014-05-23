#This script combines the test and train data from the UCI HAR Datasets. It calculates the
#average of the measurements on the mean and stand.dev. This is calculated for each activity and each subject.

#Set path to directory with the files
dir_ds <- "./UCI HAR Dataset/"

#Measured data and variablenames (columnnames) are stored in seperate file.
#load variablenames (features) and the data (Xtest and Xtrain).
#Then set the columnnames to the data
ds.features <- read.table(paste(dir_ds, "features.txt", sep=""))
ds.Xtest <- read.table(paste(dir_ds, "test/X_test.txt", sep=""))
ds.Xtrain <- read.table(paste(dir_ds, "train/X_train.txt", sep=""))
colnames(ds.Xtest) <- ds.features[,2]
colnames(ds.Xtrain) <- ds.features[,2]
ds.features <- NULL

#Measured data and subjects are stored in seperate file.
#Add the subject to the data
ds.Xtest.subject <- read.table(paste(dir_ds, "test/subject_test.txt", sep=""))
ds.Xtrain.subject <- read.table(paste(dir_ds, "train/subject_train.txt", sep=""))
colnames(ds.Xtest.subject) <- "Subject"
colnames(ds.Xtrain.subject) <- "Subject"
ds.Xtest <- cbind(ds.Xtest.subject, ds.Xtest)
ds.Xtrain <- cbind(ds.Xtrain.subject, ds.Xtrain)
ds.Xtest.subject <- NULL
ds.Xtrain.subject <- NULL

#Every observation is a activity. The activities are stored in Ytest.txt and Ytrain.txt files. 
#In these files the activity is a number.
#This number belongs to a description. This description is stored in the file activity_labels.txt
#Here, we bind the description from activity_labels.txt to all observation for Xtest and Xtrain
ds.activity_labels <- read.table(paste(dir_ds, "activity_labels.txt", sep=""))
colnames(ds.activity_labels) <- c("ActivityId", "ActivityName")

ds.Ytest <- read.table(paste(dir_ds, "test/Y_test.txt", sep=""))
colnames(ds.Ytest) <- "ActivityId"
ds.Xtest <- cbind(ds.Xtest, ds.Ytest)
ds.Xtest.merged <- merge(ds.activity_labels, ds.Xtest)

ds.Ytrain <- read.table(paste(dir_ds, "train/Y_train.txt", sep=""))
colnames(ds.Ytrain) <- "ActivityId"
ds.Xtrain <- cbind(ds.Xtrain, ds.Ytrain)
ds.Xrain.merged <- merge(ds.activity_labels, ds.Xtrain)

ds.combined.all <- rbind(ds.Xtest.merged, ds.Xrain.merged)

ds.activity_labels <- NULL
ds.Xtest <- NULL
ds.Xtrain <- NULL
ds.Ytest <- NULL
ds.Ytrain <- NULL
ds.Xtest.merged <- NULL
ds.Xrain.merged <- NULL

#Now we combined all the data including description of the data. We only want the variable on the
#mean and the standard deviation. We add these columns to a new dataset, including activity_name and subject
ds.combined <- ds.combined.all[,c(grep("mean()", colnames(ds.combined.all), fixed=TRUE), grep("std()", colnames(ds.combined.all), fixed=TRUE), grep("ActivityName", colnames(ds.combined.all), fixed=TRUE), grep("Subject", colnames(ds.combined.all), fixed=TRUE))]
ds.combined.all <- NULL

#Assign redable variable names to the labels
colnames(ds.combined) <- gsub("body body", "body", colnames(ds.combined))
colnames(ds.combined) <- gsub("tBody", "TimeBody", colnames(ds.combined))
colnames(ds.combined) <- gsub("tGravity", "TimeGravity", colnames(ds.combined))
colnames(ds.combined) <- gsub("fBody", "FreqBody", colnames(ds.combined))
colnames(ds.combined) <- gsub("fGravity", "FreqGravity", colnames(ds.combined))
colnames(ds.combined) <- gsub("mean", "Mean", colnames(ds.combined))
colnames(ds.combined) <- gsub("std", "Std", colnames(ds.combined))
colnames(ds.combined) <- gsub("\\()", "", colnames(ds.combined))
colnames(ds.combined) <- gsub("-", " ", colnames(ds.combined))
colnames(ds.combined) <- gsub(" ", "", colnames(ds.combined))

#Use plyr package to calculate the average of each variable for each activity and each subject
library(plyr)
ds.averages <- ddply(ds.combined, c("ActivityName", "Subject"), numcolwise(mean))

#Write output to txt-file, tab-delimited.
write.table(ds.averages, paste(dir_ds, "AveragesByActivityAndSubject.txt", sep=""), sep="\t")
ds.averages <- NULL
ds.combined <- NULL