This file explains all the variables, features, calculations performed as part of the Week4 Assignment of the Getting and Cleaning Data assignment

There are two sets of data: training and test data. We can see that the main data captured from devices are under InertialSignals folder. This folder contains three sets of raw data - X, Y and Z

acceleration signals in gravity units
acceleration signals subtracting the gravity
angular velocity in radians/second
For our assignment we take the two main files : X_train.txt and X_test.txt. This contains 561 columns.

Each of the column is one of the below calculation: mean(): Mean value std(): Standard deviation mad(): Median absolute deviation max(): Largest value in array min(): Smallest value in array sma(): Signal magnitude area energy(): Energy measure. Sum of the squares divided by the number of values. iqr(): Interquartile range entropy(): Signal entropy arCoeff(): Autorregresion coefficients with Burg order equal to 4 correlation(): correlation coefficient between two signals maxInds(): index of the frequency component with largest magnitude meanFreq(): Weighted average of the frequency components to obtain a mean frequency skewness(): skewness of the frequency domain signal kurtosis(): kurtosis of the frequency domain signal bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. angle(): Angle between to vectors.

So the process followed for completing this assignment is as below:

The X_train and X_test seemed clean i.e. all columns were populated, there were no NAs or badly formated data
It was safe to merge the two tables to form one single data set
Similarly the y_train and y_test that contains the activity labels also had the same number of rows as the X_train and X_test and so the two 'y*' files were merged to form a common file
Next step was to merge the activities with the measurements. This enabled to create a view of the various values per activity
Further as per requirements all the mean and standard deviation values were extracted to form a separate data table
Now all that was left is to perform a three way join with the measurements, activity and subject
Finally as the last step we can calculate the mean of each measurement by using the aggregate function that performs aggregation in groups. In our assignment we need to group by activity and then by subject.
