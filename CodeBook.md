Code Book
========================================================

This document describes the details of variable selections and calculations in the run_analysis.R file. 

## Raw Data Sets

The following data sets are considered in this exercise: 

* features
* activity_labels
* subject sets: Combined subject_train and subject_test
* X sets: Combined X_train and X_test
* y sets: Combined y_train and y_test

## Raw Variables

The variables selected for this exercise are the means and standard deviations of the following initial attributes:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

They turned out to be 66 features as following. The numbers next to the features' description refer to the original indexing in the features.txt file. Only the descriptive part of each record is selected for the final data set. 

* 1 tBodyAcc-mean()-X
* 2 tBodyAcc-mean()-Y
* 3 tBodyAcc-mean()-Z
* 4 tBodyAcc-std()-X
* 5 tBodyAcc-std()-Y
* 6 tBodyAcc-std()-Z
* 41 tGravityAcc-mean()-X
* 42 tGravityAcc-mean()-Y
* 43 tGravityAcc-mean()-Z
* 44 tGravityAcc-std()-X
* 45 tGravityAcc-std()-Y
* 46 tGravityAcc-std()-Z
* 81 tBodyAccJerk-mean()-X
* 82 tBodyAccJerk-mean()-Y
* 83 tBodyAccJerk-mean()-Z
* 84 tBodyAccJerk-std()-X
* 85 tBodyAccJerk-std()-Y
* 86 tBodyAccJerk-std()-Z
* 121 tBodyGyro-mean()-X
* 122 tBodyGyro-mean()-Y
* 123 tBodyGyro-mean()-Z
* 124 tBodyGyro-std()-X
* 125 tBodyGyro-std()-Y
* 126 tBodyGyro-std()-Z
* 161 tBodyGyroJerk-mean()-X
* 162 tBodyGyroJerk-mean()-Y
* 163 tBodyGyroJerk-mean()-Z
* 164 tBodyGyroJerk-std()-X
* 165 tBodyGyroJerk-std()-Y
* 166 tBodyGyroJerk-std()-Z
* 201 tBodyAccMag-mean()
* 202 tBodyAccMag-std()
* 214 tGravityAccMag-mean()
* 215 tGravityAccMag-std()
* 227 tBodyAccJerkMag-mean()
* 228 tBodyAccJerkMag-std()
* 240 tBodyGyroMag-mean()
* 241 tBodyGyroMag-std()
* 253 tBodyGyroJerkMag-mean()
* 254 tBodyGyroJerkMag-std()
* 266 fBodyAcc-mean()-X
* 267 fBodyAcc-mean()-Y
* 268 fBodyAcc-mean()-Z
* 269 fBodyAcc-std()-X
* 270 fBodyAcc-std()-Y
* 271 fBodyAcc-std()-Z
* 345 fBodyAccJerk-mean()-X
* 346 fBodyAccJerk-mean()-Y
* 347 fBodyAccJerk-mean()-Z
* 348 fBodyAccJerk-std()-X
* 349 fBodyAccJerk-std()-Y
* 350 fBodyAccJerk-std()-Z
* 424 fBodyGyro-mean()-X
* 425 fBodyGyro-mean()-Y
* 426 fBodyGyro-mean()-Z
* 427 fBodyGyro-std()-X
* 428 fBodyGyro-std()-Y
* 429 fBodyGyro-std()-Z
* 503 fBodyAccMag-mean()
* 504 fBodyAccMag-std()
* 516 fBodyBodyAccJerkMag-mean()
* 517 fBodyBodyAccJerkMag-std()
* 529 fBodyBodyGyroMag-mean()
* 530 fBodyBodyGyroMag-std()
* 542 fBodyBodyGyroJerkMag-mean()
* 543 fBodyBodyGyroJerkMag-std()

For detailed description of these features, please refer to the references provided in the README document. 

## Merge Process
The 66 features described above are selected from the X data set. The result of this subsetting, and y and subject data sets are  combined column-wise into the final data set. The final data set now contains the 66 variables described above plus 2 additional variables: subject and activity. 

## Clean Labels
The activity names in the final data set are replaced with their corresponding descriptions. The  labels of the variables are also cleaned for more clarity: 
* Hyphens and parentheses are removed 
* Duplicate words are removed
* Abbreviations are expanded, and  
* Labels are turned to CamelCase 

## Summarize Final Data Set
The tidy data set summarizes the mean of the 66 variables per subject/activity in the final data set. The tiday data is captured in the  tidy_data.txt file. 

