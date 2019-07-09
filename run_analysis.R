## download data from url provided in assignment
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "zipfile.zip")


## read necessary data tables into R
library(data.table)
traindata <- read.table(unz("zipfile.zip", "UCI HAR Dataset/train/X_train.txt"))
testdata <- read.table(unz("zipfile.zip", "UCI HAR Dataset/test/X_test.txt"))
trainActivity <- read.table(unz("zipfile.zip", "UCI HAR Dataset/train/y_train.txt"))
testActivity <- read.table(unz("zipfile.zip", "UCI HAR Dataset/test/y_test.txt"))
Activity <- read.table(unz("zipfile.zip", "UCI HAR Dataset/activity_labels.txt"))
trainSubject <- read.table(unz("zipfile.zip", "UCI HAR Dataset/train/subject_train.txt"))
testSubject <- read.table(unz("zipfile.zip", "UCI HAR Dataset/test/subject_test.txt"))
labels <- read.table(unz("zipfile.zip", "UCI HAR Dataset/features.txt"))


## remove zip file; no longer needed
unlink("zipfile.zip")


## use features.txt file to add descriptive column headers to each data set
names(traindata) <- labels[,2]
names(testdata) <- labels[,2]


## add Activity column to each data set (do before combining)
trainActivityLabels <- trainActivity
trainActivityLabels$V2 <- Activity$V2[match(trainActivityLabels$V1,Activity$V1)]
traindata <- cbind(trainActivityLabels[,2],traindata)

testActivityLabels <- testActivity
testActivityLabels$V2 <- Activity$V2[match(testActivityLabels$V1,Activity$V1)]
testdata <- cbind(testActivityLabels[,2],testdata)


## add Subject column to each data set and rename column (do before combining)
traindata <- cbind(trainSubject,traindata)
names(traindata)[1] <- "Subject"
names(traindata)[2] <- "Activity"

testdata <- cbind(testSubject,testdata)
names(testdata)[1] <- "Subject"
names(testdata)[2] <- "Activity"


## combine train and test data sets
combinedData <- rbind(traindata,testdata)


## extract only measurements on the mean and stanard deviation for each measurement
extractData <- combinedData[,grep(("Subject|Activity|mean()|std()"),names(combinedData))]


## install dplyr
install.packages("dplyr")
library(dplyr)


## group data by Subject and Activity, and summarize by showing the mean of each column
tidydata <- extractData %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))

## view a subset of the tidy data set
tidydata

## export the tidy data set to .txt file
write.table(tidydata, "tidydata.txt", row.names = FALSE)
