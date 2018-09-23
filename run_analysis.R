library(readr)
library(plyr)
library(dplyr)
library(tidyr)

# Read file with the variable (column) names for the test and for the training data
mylabel<-read.delim(".\\features.txt",header = FALSE,sep = " ")

# Read file with the test data
testdata<- read.fwf(".\\test\\X_test.txt",header = FALSE,widths = c(17, rep(16, 560)))
names(testdata)<- mylabel$V2    # add the variable (column) names from "mylabel"

# Add a new column "dataset" to identify this portion of data as coming from the "test" observations
testdata <- cbind(testdata, dataset = "test")

# Read file with the subjects who were observed in each row of the test data
testsubjects <- as.list(read.delim(".\\test\\subject_test.txt", header = FALSE))
names(testsubjects) <- "subject"

# Add a column "subject" to hold the subject numbers
testdata <- cbind(testdata, subject = testsubjects)

# Read file with the activity no of each observation row of the test data
activitycode  <- read.delim(".\\test\\y_test.txt", header=FALSE)
names(activitycode) <- "activitynumber"

# Read file with the activity descriptions that corresponds to the activity numbers
activity1 <- read.delim(".\\activity_labels.txt",header=FALSE,sep = " ")
names(activity1) <- c("activitynumber","activity")  # give column names to allow join on "activitynumber"

# Add a column "activitynumber" to hold the activity code
testdata <- cbind(testdata, activitynumber = activitycode)

# Add a column from the activity table to hold the description of each activity
testdata <- join(testdata,activity1)

### Read file with the training data
traindata<- read.fwf(".\\train\\X_train.txt",header = FALSE,widths = c(17, rep(16, 560)))
names(traindata)<- mylabel$V2    # add the variable (column) names from "mylabel"

# Add a new column "dataset" to identify this portion of data as coming from the "training" observations
traindata <- cbind(traindata, dataset = "train")

# Read file with the subjects who were observed in each row of the train data
trainsubjects <- as.list(read.delim(".\\train\\subject_train.txt", header = FALSE))
names(trainsubjects) <- "subject"

# Add a column "subject" to hold the subject numbers
traindata <- cbind(traindata, subject = trainsubjects)

# Read file with the activity no of each observation row of the train data
activitycode  <- read.delim(".\\train\\y_train.txt", header=FALSE)
names(activitycode) <- "activitynumber"

# Add a column "activitynumber" to hold the activity code
traindata <- cbind(traindata, activitynumber = activitycode)

# Add a column from the activity table to hold the description of each activity
traindata <- join(traindata,activity1)

### Combine the testdata and the traindata to form a new table "rawdata"
rawdata <- rbind(testdata,traindata)

### Create a new table with only mean and standard deviation columns and the added columns from above

meanstddata <- rawdata[,grep("mean|std|subject|activity|dataset", colnames(rawdata), value = FALSE)]

# Reaarange the columns so that subject, activity and dataset are the first 3 columns.
meanstddata <- select(meanstddata, subject, activity, dataset, 1:79)

# change column names to lower case and remove abbreviations and symbols
names(meanstddata) <- tolower(names(meanstddata))
names(meanstddata) <- gsub("^t","time",names(meanstddata))
names(meanstddata) <- gsub("-x","xaxis",names(meanstddata))
names(meanstddata) <- gsub("-y","yaxis",names(meanstddata))
names(meanstddata) <- gsub("-z","zaxis",names(meanstddata))
names(meanstddata) <- gsub("freq","frequency",names(meanstddata))
names(meanstddata) <- gsub("mag","magnitude",names(meanstddata))
names(meanstddata) <- gsub("^f","frequencydomain",names(meanstddata))
names(meanstddata) <- gsub("acc","accelerator",names(meanstddata))
names(meanstddata) <- gsub("\\(\\)","",names(meanstddata))
names(meanstddata) <- gsub("gyro","gyroscope",names(meanstddata))
names(meanstddata) <- gsub("-","",names(meanstddata))
names(meanstddata) <- gsub("std","standarddeviation",names(meanstddata))

# create a new table "newdata" grouped by subject and activity after removing the non-numeric dataset column
newdata <- meanstddata
newdata$dataset <- NULL
summarydata <- newdata %>% group_by(subject, activity) %>% summarize_all(funs(mean))










 
 
