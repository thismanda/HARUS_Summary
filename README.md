Human Activity Recognition Using Smartphones - Summary Dataset
========================================================

This document describes the process in which the **Human Activity Recognition Using Smartphones** dataset is  obtained, subsetted, cleaned, and summarized for further analysis. Specifically it involves the following calculations:

* Merge the training and the test sets to create one data set
* Extract the measurements on the mean and standard deviation for each measurement
* replace activity numbers with corresponding activity descriptions 
* Improve labels of variables for clarity
* Create a tidy data set with the average of each variable for each activity and each subject

# Dataset
The information about the original project may be obtained from the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original dataset may be retrieved from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Files included in this exercise
* This README document
* run_analysis: the script that reads the dataset and generates the final tidy data
* CodeBook: the document that describes how variables are selected and the final tidy data is calculated
* tidy_data: The output of running the run_analysis script on the original dataset, in tab delimited text format


# Setup
The run_analysis script is in R and therefore it needs R version 3.* to be installed on your machine. The working directory needs to be set in your R environment before running the script. The dataset needs to be retrieved from the provided link under the **Dataset** section and unzipped into your working directory. This will create the **UCI HAR Dataset** folder in your working directory. Then running the run_analysis script in R will generate the tidy_data file.  
