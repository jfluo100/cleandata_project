# Load the training and test data
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

#Load the training and test subject data
subject_train <- read.table("train/subject_train.txt")
names(subject_train) <- c('Subject')

subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- c('Subject')


# Part 1: Merge the training and the test sets to create one data set.
# Here the number of rows in X and Y in train and test data set were found to match ( 7352 in train and 2947 in test)
# This was the case for the subject and activity i.e. number of rows were exactly same
# So it was safe to do a rbind to simple append the rows at the end of the data set
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
# The activity ID will be used to join between the activity labels furhter down the assignment
names(y) <- c('ActivityID')

# Part 2: Extract only the measurements on the mean and standard deviation for each measurement.
# The columns that contain the various measurements were present in features.txt. It has totally 561 different calculations
# features.txt has a nicely provided column number for each row.
# The column numbers that contained the mean and std calculations were manually extracted
# Perhaps there is an automated way to do this, #TODO to explore this futher
# A numeric vector cols with the column numbers of the mean and std calculations
# Using the cols vector, all the meand and std values are extracted into the dataframe X_mean_std

cols <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84,
          85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 
          165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 
          266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 
          424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)

X_mean_std <- X[ ,cols]

# Part 4: Provide meaningingful names to all the measurements extracted.
# These values were again manually extracted from the features.txt #TODO to see if there is an automated way to get this
names(X_mean_std) <- c("tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ", "tBodyAccStdX", 
                       "tBodyAccStdY", "tBodyAccStdZ", "tGravityAccMeanX", "tGravityAccMeanY", 
                       "tGravityAccMeanZ", "tGravityAccStdX", "tGravityAccStdY", 
                       "tGravityAccStdZ", "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", 
                       "tBodyAccJerkMeanZ", "tBodyAccJerkStdX", "tBodyAccJerkStdY", 
                       "tBodyAccJerkStdZ", "tBodyGyroMeanX", "tBodyGyroMeanY", "tBodyGyroMeanZ", 
                       "tBodyGyroStdX", "tBodyGyroStdY", "tBodyGyroStdZ", "tBodyGyroJerkMeanX", 
                       "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ", "tBodyGyroJerkStdX", 
                       "tBodyGyroJerkStdY", "tBodyGyroJerkStdZ", "tBodyAccMagMean", 
                       "tBodyAccMagStd", "tGravityAccMagMean", "tGravityAccMagStd", 
                       "tBodyAccJerkMagMean", "tBodyAccJerkMagStd", "tBodyGyroMagMean", 
                       "tBodyGyroMagStd", "tBodyGyroJerkMagMean", "tBodyGyroJerkMagStd", 
                       "fBodyAccMeanX", "fBodyAccMeanY", "fBodyAccMeanZ", "fBodyAccStdX", 
                       "fBodyAccStdY", "fBodyAccStdZ", "fBodyAccJerkMeanX", "fBodyAccJerkMeanY", 
                       "fBodyAccJerkMeanZ", "fBodyAccJerkStdX", "fBodyAccJerkStdY", 
                       "fBodyAccJerkStdZ", "fBodyGyroMeanX", "fBodyGyroMeanY", "fBodyGyroMeanZ", 
                       "fBodyGyroStdX", "fBodyGyroStdY", "fBodyGyroStdZ", "fBodyAccMagMean", 
                       "fBodyAccMagStd", "fBodyBodyAccJerkMagMean", "fBodyBodyAccJerkMagStd", 
                       "fBodyBodyGyroMagMean", "fBodyBodyGyroMagStd", "fBodyBodyGyroJerkMagMean", 
                       "fBodyBodyGyroJerkMagStd")

# Part 3: Merge the activity values into the activity data set
# Each of them to now contain both the activity id and the activity name
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c('ActivityID', 'Activity')
library(dplyr)
# Performing a left join to add the activity labels to all the activity IDs 
activity_merged <- left_join(y, activity_labels, by="ActivityID")

# Finally: Step 1 merge the activity values with the mean_std data set. Step 2: merge the subject who has taken participated in the activity
X_final <- cbind(subject$Subject, activity_merged$Activity, X_mean_std)
# label the columns to clearly identify the columns
names(X_final)[1:2] <- c('Subject', 'Activity')
# Somehow the activity labels were converted to factors, so converting them to character vector.
# Not sure if this is going to be a problem
X_final$Activity <- as.character(X_final$Activity)

# Part 5: create a second, independent tidy data set with the average of each variable for each activity and each subject.
# The aggregate function helps perform aggregate functions in groups.
# The groups here are to be activity and then subject
final_tidy_dataset_ActivitySubject <- aggregate(X_final[, 3:68], list(X_final$Activity, X_final$Subject), mean)
names(final_tidy_dataset_ActivitySubject)[1:2] <- c('Activity', 'Subject')
