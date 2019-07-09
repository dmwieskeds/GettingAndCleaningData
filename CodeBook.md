# GETTING AND CLEANING DATA COURSE PROJECT
SOURCE DATA: SAMSUNG GALAXY S SMARTPHONE DATA FROM ACCELEROMETERS


The R script for this project contains the URL and code for downloading the data, unzipping the zip file, loading the necessary files into R, and then removing the zip file.

The source data for this project is from experiments on Human Activity Recognition Using Smartphones.  The full description of the project and the original data can be found at the following website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The following tables from the original data set are used in this project:

| Original file             | Variable assigned | Description
| ------                    | ------            | ------ |
| train/X_train.txt         | traindata         | training data
| train/y_train.txt         | trainActivity     | activity code number for training data
| train/subject_train.txt   | trainSubject      | subject number for training data
| |
| test/X_test.txt           | testdata          | test data
| test/y_test.txt           | testActivity      | activity code number for test data
| test/subject_test.txt     | testSubject       | subject number for test data
| |
| activity_labels.txt       | Activity          | activity code number and description
| features.txt              | labels            | column labels for both data sets


The following steps were taken to merge and label the data sets (code in R script):
1.	The features.txt file is a list of the column names for both the training and test data.  Used names() to replace the non-descriptive column names in each data set.
2.	The activity being performed for each measure is contained in separate files in the original data (y_train.txt and y_test.txt).  First added a new column with the description corresponding to each activity number from the activity_labels.txt data using match().  Then used cbind() to append the activity description as a new column in each data set. 
3.	The subject performing each measure is contained in a separate files in the original data (subject_train and subject_test).  Used cbind() to append the subject number as a new column in each data set.
4.	Renamed the two new columns in each data set to “Subject” and “Activity”.
5.	Used rbind() to append the two data sets together into one data set.  Assigned the result to variable “combinedData”.
6.	Used grep to extract only the columns for “Subject”, “Activity”, and any with “mean()” or “std()” in the column name.  Assigned the result to variable “extractData”.
7.	Grouped the data by “Subject” and “Activity”, and summarized to show the mean of each measure for each subject/activity combination, and assigned output to a new, tidy data set called “tidydata”.
8.	Exported the new data set to a .txt file.


Following are the fields used for this project (after extracting the columns needed in Step 6 above):

| Feature                   | Description
| ------                    | ------ 
| Subject                   | Integer from 1-30 representing the individual being measured
| Activity                  | One of six activities performed while wearing a smartphone (Samsung Galaxy S II) on the waist
| 	|
| tBodyAcc-mean()-X	    | Mean body acceleration (time) in X direction
| tBodyAcc-mean()-Y	    | Mean body acceleration (time) in Y direction
| tBodyAcc-mean()-Z         | Mean body acceleration (time) in Z direction
| tBodyAcc-std()-X          | Standard deviation of body acceleration (time) in X direction
| tBodyAcc-std()-Y          | Standard deviation of body acceleration (time) in Y direction
| tBodyAcc-std()-Z          | Standard deviation of body acceleration (time) in Z direction
| tGravityAcc-mean()-X      | Mean gravity acceleration (time) in X direction
| tGravityAcc-mean()-Y      | Mean gravity acceleration (time) in Y direction
| tGravityAcc-mean()-Z      | Mean gravity acceleration (time) in Z direction
| tGravityAcc-std()-X       | Standard deviation of gravity acceleration (time) in X direction
| tGravityAcc-std()-Y       | Standard deviation of gravity acceleration (time) in Y direction
| tGravityAcc-std()-Z       | Standard deviation of gravity acceleration (time) in Z direction
| tBodyAccJerk-mean()-X     | Mean body acceleration (time) Jerk signal in X direction
| tBodyAccJerk-mean()-Y     | Mean body acceleration (time) Jerk signal in Y direction
| tBodyAccJerk-mean()-Z     | Mean body acceleration (time) Jerk signal in Z direction
| tBodyAccJerk-std()-X      | Standard deviation of body acceleration (time) Jerk signal, X dir
| tBodyAccJerk-std()-Y      | Standard deviation of body acceleration (time) Jerk signal, Y dir
| tBodyAccJerk-std()-Z      | Standard deviation of body acceleration (time) Jerk signal, Z dir
| tBodyGyro-mean()-X        | Mean body angular velocity (time) in X direction
| tBodyGyro-mean()-Y        | Mean body angular velocity (time) in Y direction
| tBodyGyro-mean()-Z        | Mean body angular velocity (time) in Z direction
| tBodyGyro-std()-X         | Standard deviation of body angular velocity (time) in X direction
| tBodyGyro-std()-Y         | Standard deviation of body angular velocity (time) in Y direction
| tBodyGyro-std()-Z         | Standard deviation of body angular velocity (time) in Z direction
| tBodyGyroJerk-mean()-X    | Mean body angular velocity (time) Jerk signal in X direction
| tBodyGyroJerk-mean()-Y    | Mean body angular velocity (time) Jerk signal in Y direction
| tBodyGyroJerk-mean()-Z    | Mean body angular velocity (time) Jerk signal in Z direction
| tBodyGyroJerk-std()-X     | Std deviation of body angular velocity (time) Jerk signal, X dir
| tBodyGyroJerk-std()-Y     | Std deviation of body angular velocity (time) Jerk signal, Y dir
| tBodyGyroJerk-std()-Z     | Std deviation of body angular velocity (time) Jerk signal, Z dir
| tBodyAccMag-mean()        | Mean of body acceleration magnitude (time)
| tBodyAccMag-std()         | Standard deviation of body acceleration magnitude (time)
| tGravityAccMag-mean()     | Mean of gravity acceleration magnitude (time)
| tGravityAccMag-std()      | Standard deviation of gravity acceleration magnitude (time)
| tBodyAccJerkMag-mean()    | Mean of body acceleration (time) Jerk signal magnitude
| tBodyAccJerkMag-std()     | Std deviation of body acceleration (time) Jerk signal magnitude
| tBodyGyroMag-mean()       | Mean of angular velocity (time) magnitude
| tBodyGyroMag-std()        | Standard deviation of angular velocity (time) magnitude
| tBodyGyroJerkMag-mean()   | Mean of gravity acceleration (time) Jerk signal magnitude
| tBodyGyroJerkMag-std()    | Std dev of gravity acceleration (time) Jerk signal magnitude
| fBodyAcc-mean()-X         | Mean body acceleration (frequency) in X direction
| fBodyAcc-mean()-Y         | Mean body acceleration (frequency) in Y direction
| fBodyAcc-mean()-Z         | Mean body acceleration (frequency) in Z direction
| fBodyAcc-std()-X          | Std deviation of body acceleration (frequency) in X direction
| fBodyAcc-std()-Y          | Std deviation of body acceleration (frequency) in Y direction
| fBodyAcc-std()-Z          | Std deviation of body acceleration (frequency) in Z direction
| fBodyAcc-meanFreq()-X     | Weighted avg of body acceleration frequency in X direction
| fBodyAcc-meanFreq()-Y     | Weighted avg of body acceleration frequency in Y direction
| fBodyAcc-meanFreq()-Z     | Weighted avg of body acceleration frequency in Z direction
| fBodyAccJerk-mean()-X     | Mean body acceleration (frequency) Jerk signal in X direction
| fBodyAccJerk-mean()-Y     | Mean body acceleration (frequency) Jerk signal in Y direction
| fBodyAccJerk-mean()-Z     | Mean body acceleration (frequency) Jerk signal in Z direction
| fBodyAccJerk-std()-X		| Std dev of body acceleration (frequency) Jerk signal in X dir
| fBodyAccJerk-std()-Y		| Std dev of body acceleration (frequency) Jerk signal in Y dir
| fBodyAccJerk-std()-Z		| Std dev of body acceleration (frequency) Jerk signal in Z dir
| fBodyAccJerk-meanFreq()-X	| Weighted avg of body acceleration (freq) Jerk signal in X dir
| fBodyAccJerk-meanFreq()-Y	| Weighted avg of body acceleration (freq) Jerk signal in Y dir
| fBodyAccJerk-meanFreq()-Z	| Weighted avg of body acceleration (freq) Jerk signal in Z dir
| fBodyGyro-mean()-X		| Mean body angular velocity (frequency) in X direction
| fBodyGyro-mean()-Y		| Mean body angular velocity (frequency) in Y direction
| fBodyGyro-mean()-Z		| Mean body angular velocity (frequency) in Z direction
| fBodyGyro-std()-X			| Std deviation of body angular velocity (frequency) in X direction
| fBodyGyro-std()-Y			| Std deviation of body angular velocity (frequency) in Y direction
| fBodyGyro-std()-Z			| Std deviation of body angular velocity (frequency) in Z direction
| fBodyGyro-meanFreq()-X	| Weighted avg of body angular velocity (frequency) in X direction
| fBodyGyro-meanFreq()-Y	| Weighted avg of body angular velocity (frequency) in Y direction
| fBodyGyro-meanFreq()-Z	| Weighted avg of body angular velocity (frequency) in Z direction
| fBodyAccMag-mean()		| Mean of body acceleration magnitude (frequency)
| fBodyAccMag-std()			| Standard deviation of body acceleration magnitude (frequency)
| fBodyAccMag-meanFreq()	| Weighted average of body acceleration magnitude (frequency)
| fBodyBodyAccJerkMag-mean()
| fBodyBodyAccJerkMag-std()
| fBodyBodyAccJerkMag-meanFreq()
| fBodyBodyGyroMag-mean()
| fBodyBodyGyroMag-std()
| fBodyBodyGyroMag-meanFreq()
| fBodyBodyGyroJerkMag-mean()
| fBodyBodyGyroJerkMag-std()
| fBodyBodyGyroJerkMag-meanFreq()