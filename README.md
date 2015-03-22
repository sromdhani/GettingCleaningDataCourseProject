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

### 4- Part4: Appropriately labels the data set with descriptive variable names.

We found it's useful to rename the columns from the beginning
- we get the name of the columns for the data set from the data frame  features [,2]
- we renames column for the labels data frame by "activity_id"
- we renamed the column for the subject data frame by "subject"

### Finally, we merged the 3 ("all_x_data","all_y_data" and "all_subject_dat") data frames into one single data frame named "all_data" using cbind

### Part2 : Extracts only the measurements on the mean and standard deviation for each measurement.

- First we get the indices of the columns that contain the means or std using grep function on the feature data frame
- then we extract the data of that specific columns indicated by their indices from "all_data" data frame and create a new data frame names "tidy_data"

###Part 3: Uses descriptive activity names to name the activities in the data set

- first, we rename the columns of the "activity_labels" data frame into "activity_id" for the first column and "activity_name" for the second column. These new names are useful for making the join after
- join the two data frames  tidy_data and activity_labels on "activity_id"
- it's important to remove the column activity_id from the new data frame

### Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- We first need to melt the data frame where the ids = c ("subject", "activity_name") and the variables are the rest of columns
- Then we cast the data having as function "mean" : dcast(dataMelt, subject+activity_name ~ variable, mean)
- Finally, write the new data using write.table(data, file = "tidy_data.txt",  row.name=FALSE)




