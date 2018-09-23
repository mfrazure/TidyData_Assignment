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

  ## Code Book  
