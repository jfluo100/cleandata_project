X_train: The original training data set. The data contains 561 column values each representing the list of features present in feature_info.txt. There are 7352 observations in this data set

y_train: The activity training data set. The file contains the list of the activites against the X_train data. It represents the 6 activities: 1 WALKING

    2 WALKING_UPSTAIRS
    
    3 WALKING_DOWNSTAIRS
    
    4 SITTING
    
    5 STANDING
    
    6 LAYING
X_test: The test data set. The data contains 561 columns. Each column represents all the features listed in features_info.txt. There are 2947 observations in this data set

y_test: The test activity data set. The file contains the list of the activities against the X_test data set. It represents the 6 activities: 1 WALKING

    2 WALKING_UPSTAIRS
    
    3 WALKING_DOWNSTAIRS
    
    4 SITTING
    
    5 STANDING
    
    6 LAYING
subject_train: This data table represents the training list of subjects/participants (Numbered 1 to 30) whose various activities have been captured. The data is mutually exclusive with the subject_test

subject_test: This data table represents the test list of subjects/participants (Numbered 1 to 30) whose various activities have been captured.The data is mutually exclusive with the subject_train

X: data table represents the final merged observations of the train and test data set

Y: data table represents the final merged activity list of the train and test data set

cols: The column index with the mean and std measurements that needs to be extracted from X

X_mean_std: the extracted data set that contains all the mean and std observations

activity_labels: The names of all the activities listed under Y

activity_merged: The data table representing the names of the activity against the activity id

X_final: Data set that contains the subject, activity and the mean and std values merged to form one final data set

final_tidy_dataset_ActivitySubject: The final data set that contains the mean and std grouped by activity and subject
