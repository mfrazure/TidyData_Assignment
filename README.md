# TidyData_Assignment

  ## Summary  

  This is an exercise requiring the examination of the *Human Activity Recognition Using Smartphones Dataset
Version 1.0* referenced in the README.txt file contained in this GitHub repository. The assignment requires me to create an .R script that:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.   

The .R script is named **run_analysis.R** and the independent tidy dataset with averages is named: **summarydata.txt**

  ## How to run the script

1. Load the data contained in the zip file located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract to a local computer.

2. Using R or R Studio, set the working directory to the folder containing the extracted files.

3. Source the script, **run_analysis.R**

4. The script will call 4 packages:
    * readr
    * tidyr
    * plyr
    * dplyr
    *If your instance of R does not have one or more of these installed, please run the command **install.packages(...)** for any missing library.*

5. The combined test and training data will be stored as a dataframe named *rawdata* completing step 1 of the assignment requirement.

6. The extracted mean and standard deviation dataframe is named *meanstddata*; this includes the activity descriptions and the descriptive variable names as well.  This completes steps 2-4 of the assignment requirement.

7. The final tidy dataset with the average of all measures in the above data frame grouped by subject and activity is named *summarydata*.

## Source Data Understanding  

Initial review of the datasets provides insight on how the accomplish the tasks.  The top folder includes the column names (variables) in the features.txt file and the activity types in the activity.txt file.  the two sub-folders of test and train contain the measurements taken, the list of subjects being observed and the activities being performed during a measurement.  

The measurements are held in X_test.txt and X_train.txt, the subjects are in subject_test.txt and subject_train.txt, and the activities are in Y_test.txt and Y-train.txt.  

Examination of the X_test file shows 561 columns which matches the number variables in the features.txt file.  The number of rows matches the number of subject_test lines and the number of Y_test lines.  So the column names and the subject and activity being measured match up.  The same holds for the X_train data using the subject_train and Y_train data.

## Code Book  

The approach I used in the script was pretty simple and not the most efficient or quick, but it worked for me.  

### Create the dataframe with mean and standard deviation data  

* I read the labels into *mylabel*
* I read the X_test data into *testdata*
* I add the *mylabel* as the column names of *testdata*
* I read the subject_test into *testsubjects* and add the subject column to testdata
* I read the Y_test into *activitycode* and add the activitynumber column to testdata
* I read the activity_labels into *activity1*, rename the columns to activitynumber and activity
* I join activity1 with testdata to create the activity column in testdata
* I then repeat the entire process with the X_train data
* ...
* I then combine the testdata and traindata to form the combined dataframe *rawdata*
* I then subset the data by pulling the columns with the terms of "mean", "std", "subject", or "activity" in the name and call the dataframe *meanstddata*
* I then rearrange the columns so that subject and activity are the first two columns.

### Simplify the variable names  

* reduce all names to lower case
* change all measures starting with t to starting with time
* change all instances of -x, -y, and -z to xaxis, yaxis and zaxis
* change all instances of freq and mag to frequency and magnitude
* change all measures starting with f to frequency domain
* change all instances of acc to accelerator
* remove all instances of () from the variable names
* change all instances of gyro to gyroscope
* remove all remaining instances of -
* change all instances of std to standarddeviation

### Group by subject and activity and take the mean of each column  

* Create the summary data dataframe by grouping the above dataframe by subject and activity, and then summarizing all columns

 
