---
title: "R Data Wranging Project"
author: "Ryan Wesslen"
date: "July 21, 2015"
output: html_document
---

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Data Processing 

### Collection of the raw data
The data was pulled from a zip file pulled from the UCI Machine Learning Repository site:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Notes on the original (raw) data 
The data was collected from accelerometers from the Samsung Galaxy S smartphone for 30 subjects. Each subject performed six different daily living activities while carrying a waist-mounted smartphone with embedded inertial sensors.

A data overview is provided at this website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Creating the tidy datafile

### Guide to create the tidy data file
The steps to create the tidy data file:

1. Download and unzip the file from the UCI website
2. Data Pre-processing to create Test & Training datasets
3. Combine Test & Training datasets into one dataset
4. dpylr manipulation to create measurements on mean and standard deviations
5. Create descriptive labels for features and labels
6. Create final tidy data file

### Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

## Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

### Variable 1 (repeat this section for all variables in the dataset)





Var #	|	Variable Name	|	Format	|	Description
-----------------------------------						
1	|	Participant	|	int	|	Participant ID
2	|	LabelName	|	Fact	|	Activity (Label) Name
3	|	DataFlag	|	chr	|	Test or Training Dataset
4	|	LabelType	|	num	|	Activity (Label) Type
-----------------------------------								
5	|	TimeBodyMeanX	|	num	|	Time-Body Mean X
6	|	TimeBodyMeanY	|	num	|	Time-Body Mean Y
7	|	TimeBodyMeanZ	|	num	|	Time-Body Mean Z
8	|	TimeGravityMeanX	|	num	|	Time-Gravity Mean X
9	|	TimeGravityMeanY	|	num	|	Time-Gravity Mean Y
10	|	TimeGravityMeanZ	|	num	|	Time-Gravity Mean Z
11	|	TimeBodyJerkMeanX	|	num	|	Time-Body-Jerk Mean X
12	|	TimeBodyJerkMeanY	|	num	|	Time-Body-Jerk Mean Y
13	|	TimeBodyJerkMeanZ	|	num	|	Time-Body-Jerk Mean Z
14	|	TimeGyroscopeMeanX	|	num	|	Time-Gyroscope Mean X
15	|	TimeGyroscopeMeanY	|	num	|	Time-Gyroscope Mean Y
16	|	TimeGyroscopeMeanZ	|	num	|	Time-Gyroscope Mean Z
17	|	TimeGyroscopeJerkMeanX	|	num	|	Time-Gyroscope-Jerk Mean X
18	|	TimeGyroscopeJerkMeanY	|	num	|	Time-Gyroscope-Jerk Mean Y
19	|	TimeGyroscopeJerkMeanZ	|	num	|	Time-Gyroscope-Jerk Mean Z
20	|	TimeBodyMagnitudeMean	|	num	|	Time-Body-Magnitude Mean
21	|	TimeGravityMagnitudeMean	|	num	|	Time-Gravity-Magnitude Mean
22	|	TimeBodyJerkMagnitudeMean	|	num	|	Time-Body-Jerk-Magnitude Mean
23	|	TimeGyroscopeMagnitudeMean	|	num	|	Time-Gyroscope-Magnitude Mean
24	|	TimeGyroscopeJerkMagnitudeMean	|	num	|	Time-Gyroscope-Jerk-Magnitude Mean
-----------------------------------								
25	|	FreqBodyMeanX	|	num	|	Freq-Body Mean X
26	|	FreqBodyMeanY	|	num	|	Freq-Body Mean Y
27	|	FreqBodyMeanZ	|	num	|	Freq-Body Mean Z
28	|	FreqBodyMeanFreqX	|	num	|	Freq-Gravity MeanFreq X
29	|	FreqBodyMeanFreqY	|	num	|	Freq-Gravity MeanFreq Y
30	|	FreqBodyMeanFreqZ	|	num	|	Freq-Gravity MeanFreq Z
31	|	FreqBodyJerkMeanX	|	num	|	Freq-Body-Jerk Mean X
32	|	FreqBodyJerkMeanY	|	num	|	Freq-Body-Jerk Mean Y
33	|	FreqBodyJerkMeanZ	|	num	|	Freq-Body-Jerk Mean Z
34	|	FreqBodyJerkMeanFreqX	|	num	|	Freq-Body-Jerk MeanFreq X
35	|	FreqBodyJerkMeanFreqY	|	num	|	Freq-Body-Jerk MeanFreq Y
36	|	FreqBodyJerkMeanFreqZ	|	num	|	Freq-Body-Jerk MeanFreq Z
37	|	FreqGyroscopeMeanX	|	num	|	Freq-Gyroscope Mean X
38	|	FreqGyroscopeMeanY	|	num	|	Freq-Gyroscope Mean Y
39	|	FreqGyroscopeMeanZ	|	num	|	Freq-Gyroscope Mean Z
40	|	FreqGyroscopeMeanFreqX	|	num	|	Freq-Gyroscope MeanFreq X
41	|	FreqGyroscopeMeanFreqY	|	num	|	Freq-Gyroscope MeanFreq Y
42	|	FreqGyroscopeMeanFreqZ	|	num	|	Freq-Gyroscope MeanFreq Z
43	|	FreqBodyMagnitudeMean	|	num	|	Freq-Body-Magnitude Mean
44	|	FreqBodyMagnitudeMeanFreq	|	num	|	Freq-Body-Magnitude MeanFreq
45	|	FreqBodyBodyJerkMagnitudeMean	|	num	|	Freq-Body-Jerk-Magnitude Mean
46	|	FreqBodyBodyJerkMagnitudeMeanFreq	|	num	|	Freq-Body-Jerk-Magnitude MeanFreq
47	|	FreqBodyGyroscopeMagnitudeMean	|	num	|	Freq-Gyroscope-Magnitude Mean
48	|	FreqBodyGyroscopeMagnitudeMeanFreq	|	num	|	Freq-Gyroscope-Magnitude MeanFreq
49	|	FreqBodyGyroscopeJerkMagnitudeMean	|	num	|	Freq-Gyroscope-Jerk-Magnitude Mean
50	|	FreqBodyGyroscopeJerkMagnitudeMeanFreq	|	num	|	Freq-Gyroscope-Jerk-Magnitude MeanFreq
-----------------------------------								
51	|	TimeBodySDX	|	num	|	Time-Body Std Dev X
52	|	TimeBodySDY	|	num	|	Time-Body Std Dev Y
53	|	TimeBodySDZ	|	num	|	Time-Body Std Dev Z
54	|	TimeGravitySDX	|	num	|	Time-Gravity Std Dev X
55	|	TimeGravitySDY	|	num	|	Time-Gravity Std Dev Y
56	|	TimeGravitySDZ	|	num	|	Time-Gravity Std Dev Z
57	|	TimeBodyJerkSDX	|	num	|	Time-Body-Jerk Std Dev X
58	|	TimeBodyJerkSDY	|	num	|	Time-Body-Jerk Std Dev Y
59	|	TimeBodyJerkSDZ	|	num	|	Time-Body-Jerk Std Dev Y
60	|	TimeGyroscopeSDX	|	num	|	Time-Gyroscope Std Dev X
61	|	TimeGyroscopeSDY	|	num	|	Time-Gyroscope Std Dev Y
62	|	TimeGyroscopeSDZ	|	num	|	Time-Gyroscope Std Dev Z
63	|	TimeGyroscopeJerkSDX	|	num	|	Time-Gyroscope-Jerk Std Dev X
64	|	TimeGyroscopeJerkSDY	|	num	|	Time-Gyroscope-Jerk Std Dev Y
65	|	TimeGyroscopeJerkSDZ	|	num	|	Time-Gyroscope-Jerk Std Dev Z
66	|	TimeBodyMagnitudeSD	|	num	|	Time-Body Magnitude Std Dev
67	|	TimeGravityMagnitudeSD	|	num	|	Time-Gravity Magnitude Std Dev
68	|	TimeBodyJerkMagnitudeSD	|	num	|	Time-Body-Jerk Magnitude Std Dev
69	|	TimeGyroscopeMagnitudeSD	|	num	|	Time-Gyroscope Magnitude Std Dev
70	|	TimeGyroscopeJerkMagnitudeSD	|	num	|	Time-Gyroscope-Jerk Magnitude Std Dev
-----------------------------------								
71	|	FreqBodySDX	|	num	|	Freq-Body Std Dev X
72	|	FreqBodySDY	|	num	|	Freq-Body Std Dev Y
73	|	FreqBodySDZ	|	num	|	Freq-Body Std Dev Z
74	|	FreqBodyJerkSDX	|	num	|	Freq-Body-Jerk Std Dev X
75	|	FreqBodyJerkSDY	|	num	|	Freq-Body-Jerk Std Dev Y
76	|	FreqBodyJerkSDZ	|	num	|	Freq-Body-Jerk Std Dev Z
77	|	FreqGyroscopeSDX	|	num	|	Freq-Gyroscope Std Dev X
78	|	FreqGyroscopeSDY	|	num	|	Freq-Gyroscope Std Dev Y
79	|	FreqGyroscopeSDZ	|	num	|	Freq-Gyroscope Std Dev Z
80	|	FreqBodyMagnitudeSD	|	num	|	Freq-Body Magnitude Std Dev
81	|	FreqBodyBodyJerkMagnitudeSD	|	num	|	Freq-Body-Jerk Magnitude Std Dev
82	|	FreqBodyGyroscopeMagnitudeSD	|	num	|	Freq-Body-Gyroscope Magnitude Std Dev
83	|	FreqBodyGyroscopeJerkMagnitudeSD	|	num	|	Freq-Body Magnitude-Gyroscope-Jerk Std Dev
-----------------------------------		




#### Notes on variable 1:
Variable output was created using the "str()" function.

## Sources
Sources you used if any, otherise leave out.

## Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
