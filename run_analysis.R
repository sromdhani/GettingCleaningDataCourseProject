## download data
###############################################

URL = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("./data")){
  dir.create("./data")
}
download.file(URL, destfile = "./data/data.zip")

## unzip data
zipfile = "./data/data.zip"
unzip(zipfile, exdir = "./data")



###############Reading Data
#####################################

## read feature List

features <- read.table ("./data/features.txt")

## read Activity Labels : Links the class labels with their activity name

activity_labels <- read.table ("./data/activity_labels.txt")

## read training Set
x_train <- read.table ("./data/train/X_train.txt")

## read training labels

y_train <- read.table ("./data/train/y_train.txt")

## read subject_train the subject who performed the activity for each window sample

subject_train <- read.table ("./data/train/subject_train.txt")

## read testing Set
x_test <- read.table ("./data/test/X_test.txt")
View(x_test)
str(x_test)
## read testing Label
y_test <- read.table ("./data/test/y_test.txt")

## read subject_test the subject who performed the activity for each window sample

subject_test <- read.table ("./data/test/subject_test.txt")

########### Part 1: Merges the training and the test sets to create one data set
####################################################################################

## merge the training and testing Data

all_x_data <- rbind(x_train, x_test)
all_y_data <- rbind (y_train, y_test)
all_subject_data <- rbind(subject_train, subject_test)

###### Part4: Appropriately labels the data set with descriptive variable names.
#######################################################################################

# rename the data frame columns

names(all_x_data) <- features[,2]

names(all_y_data) <- "activity_id"

names(all_subject_data) <- "subject"

# merge all data

all_data <- cbind(all_x_data, all_y_data,all_subject_data)

############# Part2 : Extracts only the measurements on the mean and standard deviation for each measurement.
###################################################################################################################

# get the indices of the columns you want to kee

indices_mean <- grep("mean\\(\\)+", features[,2], perl=TRUE, value=FALSE)
indices_std <- grep("std+", features[,2], perl=TRUE, value=FALSE)
indices <- c(indices_mean,indices_std, c(562,563))
indices <- sort(indices)

# extract the data of the specific columns indicates by their indices

tidy_data <- all_data[, indices]
str(tidy_data)

############# Part 3: Uses descriptive activity names to name the activities in the data set
###################################################################################################


names(activity_labels) <- c("activity_id", "activity_name")

## join the two data frames  tidy_data and activity_labels on "activity_id"
library(plyr)
tidy_data <- join(tidy_data, activity_labels)
## remove the column activity_id
drops <- c("activity_id")
tidy_data <- tidy_data[,!(names(tidy_data) %in% drops)]

########## part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
####################################################################################################################################################################

library(reshape2)

dataMelt <- melt(tidy_data, id = c ("subject", "activity_name") , measure.vars = names(tidy_data)[1:66])
## melting data frame
data <- dcast(dataMelt, subject+activity_name ~ variable, mean)
## casting data frame

## write tidy data into text file


write.table(data, file = "tidy_data.txt",  row.name=FALSE)

## for testing , download data

x<- read.table ("./tidy_data.txt")


