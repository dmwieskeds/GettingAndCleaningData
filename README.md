# Getting and Cleaning Data - Course Project
Submitted by Dawn Wieske

========================================================================

Included in this repo are the following files:
- 'README.md'
- 'CodeBook.md':	outlines the steps performed in the R script
- 'run_analysis.R':	R script written for project, as described in 'CodeBook.md'

========================================================================

The output of this project is a tidy data set that is written to a .txt file called 'tidydata.txt'.  
The tidy data set has a row for each Subject/Activity combination that shows the average (mean) value for each measure.
The measures included in the tidy data set are those that showed the mean or standard deviation in the data
available in the "Human Activity Recognition Using Smartphones Dataset", which was provided in the assignment instructions.
The descriptive variable names (column headers) used were those provided in the 'features.txt' file in the original dataset.
The descriptive Activity names used in the Activity column (replacing the integer values from the original datasets)
are those provided in the 'activity_labels.txt' files in the original dataset.
The CodeBook.md file describes how the data was transformed from multiple .txt files into a single data table in R,
and then summarized to show the average (mean) of each mean and standard deviation measurement for each subject/activity combination.
