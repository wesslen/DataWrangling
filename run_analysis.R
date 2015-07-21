
## Load Libraries, Directories and Files

# One-time Unzip
# setwd("~/Documents/Classes/MOOCs/R Data Wrangling/data")
# filename = "UCI HAR Dataset.zip"
# unzip(filename)

# Libraries
library("dplyr")

# Change Working Directory
setwd("~/Documents/Classes/MOOCs/R Data Wrangling/data/UCI HAR Dataset")

# Labels & Features

Labels <- read.fwf(file="activity_labels.txt", widths=c(2, 20))
colnames(Labels) <- c("LabelType","LabelName")
Features <- read.fwf(file="features.txt", widths=c(2, 34))

# Test Data

Subject_Test <- read.fwf(file="test/subject_test.txt", widths=c(3), col.names = "Participant")
X_Test <- read.table("test/X_test.txt", col.names = Features$V2)
Y_Test <- read.fwf(file="test/y_test.txt", widths=c(2), col.names = "LabelType")

dataTest = cbind(Subject_Test,Y_Test,X_Test)

rm(list = c("Subject_Test","Y_Test","X_Test"))

# Train Data

Subject_Train <- read.fwf(file="train/subject_train.txt", widths=c(3), col.names = "Participant")
X_Train <- read.table("train/X_train.txt", col.names = Features$V2)
Y_Train <- read.fwf(file="train/y_train.txt", widths=c(2), col.names = "LabelType")

dataTrain = cbind(Subject_Train,Y_Train,X_Train)

rm(list = c("Subject_Train","Y_Train","X_Train"))

## Combine Test & Train

# Create Test/Train Flag -- Alternatively could have used "mutate()" function
dataTest$DataFlag <- apply(dataTest, 1, function(x) { DataFlag = "Test"} )
dataTrain$DataFlag <- apply(dataTrain, 1, function(x) { DataFlag = "Train"} )

# Row Bind: Merges the training and the test sets to create one data set.
dataSet = rbind(dataTest,dataTrain)

rm(list = c("dataTest","dataTrain"))

# dpylr manipulation: Extracts only the measurements on the mean and standard deviation for each measurement. 
part1 <- select(dataSet,contains("mean"),-contains("angle")) #variable includes "mean" but not "angle"
part2 <- select(dataSet,contains("std"))                     #variable includes "std"
otherVar <- select(dataSet, Participant, LabelType, DataFlag)
dataSet <- cbind(otherVar,part1, part2)
rm(list = c("part1","part2","otherVar"))

# Uses descriptive activity names to name the activities in the data set
# 86 variables

names <- names(dataSet)

# Appropriately labels the data set with descriptive variable names. 
# Give Labels a Name
dataSet <- merge(dataSet,Labels, by.x = "LabelType", by.y = "LabelType")

# From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

sumData <- dataSet %>% count(Participant,LabelName,DataFlag)
dim(sumData)

# final tidy dataset will be 180 rows
newData <- dataSet %>% group_by(Participant,LabelName,DataFlag) %>% summarise_each(funs(mean))

## Use dput(TidyDataSet, file = "TidyDataSet.R")