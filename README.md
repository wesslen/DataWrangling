# DataWrangling
Project for R Data Wrangling Course

## Data Pre-Processing

### Save and unzip the file
Saves the zip file in the working directory, unzips the file.

```{r}
# Save the current wd (just in case)
wd <- getwd()

# File URL for the zip file
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download File to zip file
filename = "UCI HAR Dataset.zip"
download.file(fileURL, destfile=filename, method="curl")

# One-time Unzip into the working directory
unzip(filename)
```

### Import dplyr
```{r}
library("dplyr")
```

### Save Labels & Features
This step saves the label and feature names. An additional step was used to remove punctuation (e.g. "(",")","-") to ensure that problems do not come in later.

```{r}
Labels <- read.fwf(file="activity_labels.txt", widths=c(2, 20))
colnames(Labels) <- c("LabelType","LabelName")

Features <- read.fwf(file="features.txt", widths=c(2, 34))
Features <- gsub("[[:punct:]]","",Features[,2])     # Remove Punctuation from Feature
```

### Test Data
Combines the Subject, X and Y variables for the Test dataset.

```{r}
Subject_Test <- read.fwf(file="test/subject_test.txt", widths=c(3), col.names = "Participant")
X_Test <- read.table("test/X_test.txt", col.names = Features)
Y_Test <- read.fwf(file="test/y_test.txt", widths=c(2), col.names = "LabelType")

dataTest = cbind(Subject_Test,Y_Test,X_Test)

rm(list = c("Subject_Test","Y_Test","X_Test"))
```

### Train Data
Combines the Subject, X and Y variables for the Training dataset.

```{r}
Subject_Train <- read.fwf(file="train/subject_train.txt", widths=c(3), col.names = "Participant")
X_Train <- read.table("train/X_train.txt", col.names = Features)
Y_Train <- read.fwf(file="train/y_train.txt", widths=c(2), col.names = "LabelType")

dataTrain = cbind(Subject_Train,Y_Train,X_Train)

rm(list = c("Subject_Train","Y_Train","X_Train"))
```

## Combine Test & Training Datasets

### Create Test/Train Flag
Creates a flag to identify the Test and Training Datasets.

```{r}
dataTest$DataFlag <- apply(dataTest, 1, function(x) { DataFlag = "Test"} )
dataTrain$DataFlag <- apply(dataTrain, 1, function(x) { DataFlag = "Train"} )
```

### Row Bind
Merges the training and the test sets to create one data set.

```{r}
dataSet = rbind(dataTest,dataTrain)
rm(list = c("dataTest","dataTrain"))
```

### dpylr Manipulation
Extracts only the measurements on the mean and standard deviation for each measurement. 

```{r}
part1 <- select(dataSet,contains("mean"),-contains("angle")) #variable includes "mean" but not "angle"
part2 <- select(dataSet,contains("std"))                     #variable includes "std"
otherVar <- select(dataSet, Participant, LabelType, DataFlag)
dataSet <- cbind(otherVar,part1, part2)
rm(list = c("part1","part2","otherVar"))
```

## Descriptive (Labels) Activity Names and Descriptive Attribute Names 

### Step 3
```{r}
# Appropriately labels the data set with descriptive variable names. 
# Give Labels a Name
dataSet <- merge(dataSet,Labels, by.x = "LabelType", by.y = "LabelType")
```

### Initial Preparation for Step 4
This step first pulls the existing descriptive names for the variables. Then it removes any "X." or "X#." prefix found in the variable names. Last, it provides a old-name-to-new-name mapping that provides more descriptive names for the variables.

```{r}
# Get current 79 attribute names
names <- names(dataSet[4:82])

# I observed that many attribute names began with a "X." or "X#." prefix
# This was done as a default in one of the data preparation steps
# I used gsub to replace "X." or "X#." prefix with "", i.e. removed it
names <- gsub("[0-9]","",names)
names <- gsub("^[X\\.]?","",names)
names <- gsub("^\\.","",names)

# replace occurrences of the phrases in origNames with the phrase in newNames
origNames <- c("BodyAcc","GravityAcc","BodyGyro","Acc","Mag",
                "meanFreq","mean","std","X","Y","Z","^t","^f")
newNames <- c("Body","Gravity","Gyroscope","Accelerator","Magnitude",
                "MeanFreq","Mean","SD","X","Y","Z","Time","Freq")

# origNames -> newNames mapping
for (i in seq(1,length(origNames),1))
  names <- gsub(origNames[i],newNames[i],names)

oldnames <- names(dataSet)
oldnames <- oldnames[4:82]  # 4:82 to save attribute names only, i.e. exclude id, labels and train/test flag
```

## Step 4: Modifying Descriptive Names for the Attributes
This step uses the setname function from the data.table to replace the descriptive names for the attributes in "oldnames" to the new attribute names in "names"

```{r}
library(data.table)
setnames(dataSet, old = oldnames, new = names)
```

## Step 5: TidyDataSet Creation and Export
From the data set in step 4, this step creates a second, independent tidy data set with the average of each attribute for each activity and each subject.

```{r}
sumData <- dataSet %>% count(Participant,LabelName,DataFlag)
dim(sumData)

# final tidy dataset will be 180 rows
TidyDataSet <- dataSet %>% group_by(Participant,LabelName,DataFlag) %>% summarise_each(funs(mean))

## Use dput(TidyDataSet, file = "TidyDataSet.R")

write.table(TidyDataSet, file = "TidyDataSet.txt", row.name=FALSE)
```