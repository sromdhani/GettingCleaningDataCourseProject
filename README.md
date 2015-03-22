# GettingCleaningDataCourseProject
Getting Cleaning Course John Hopkins University on Coursera

This file describes the steps for creating the tidy_data

### 1- First we need to download the zip file and unzip it

### 2- We read all the files independently: 
- we read the list of feature names into the data frame "features"
- we read the Activity Labels that Links the class labels with their activity name into the data frame "activity_labels"
- we read the training Set into the data frame "x_train"
- we read the training labels into the data frame "y_train"
- we read the subject_train the subject who performed the activity for each window sample into the data frame "subject_train" 
- we read the testing Set into the data frame "x_test"
- we read the testing Label into the data frame "y_test "
- Finally, we read the subject who performed the activity for each window sample into the data frame "subject_test"

### 3- For Part 1: Merges the training and the test sets to create one data set

- We merged the training set and the test set using rbind into the data frame "all_x_data"
- we merged the training labels and test labels using rbind into the data frame "all_y_data"
- we merged the training subject and test subjects using rbind into the data frame "all_subject_dat"