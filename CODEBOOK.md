Variables and transformations
=============================

The data in "tidy_data.txt" -document consists of three types of variables.

1. "subject" - the test subject id referring to the experiment participant
2. "activity"  - indicating the type of activity the test subject was engaging in when the measurements were recorded.
        - The experiment consisted of these six activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3. Number of variables based on the sensordata recorded from the mobile device. The variables are detailed below. Note that in the tidy_data.txt an additional **transformation** on all the variables have been done, where all selected sensor data has been averaged according to test subjects and activity types.
 
The features selected for the original dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are:   
* mean(): Mean value
* std(): Standard deviation


These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* __tBodyAcc-XYZ__  
        _variables in the data set:_  
        "tBodyAccMeanX" "tBodyAccMeanY" "tBodyAccMeanZ"  
        "tBodyAccStdX" "tBodyAccStdY" "tBodyAccStdZ"  

* __tGravityAcc-XYZ__  
        _variables in the data set:_  
        "tGravityAccMeanX" "tGravityAccMeanY" "tGravityAccMeanZ"  
        "tGravityAccStdX" "tGravityAccStdY" "tGravityAccStdZ"  

* __tBodyAccJerk-XYZ__  
        _variables in the data set:_  
        "tBodyAccJerkMeanX" "tBodyAccJerkMeanY" "tBodyAccJerkMeanZ"  
        "tBodyAccJerkStdX" "tBodyAccJerkStdY" "tBodyAccJerkStdZ"  

* __tBodyGyro-XYZ__  
        _variables in the data set:_  
        "tBodyGyroMeanX" "tBodyGyroMeanY" "tBodyGyroMeanZ"  
        "tBodyGyroStdX" "tBodyGyroStdY" "tBodyGyroStdZ"  

* __tBodyGyroJerk-XYZ__  
        _variables in the data set:_  
        "tBodyGyroJerkMeanX" "tBodyGyroJerkMeanY" "tBodyGyroJerkMeanZ"  
        "tBodyGyroJerkStdX" "tBodyGyroJerkStdY" "tBodyGyroJerkStdZ"  

* __tBodyAccMag__  
        _variables in the data set:_  
        "tBodyAccMagMean"  
        "tBodyAccMagStd"  

* __tGravityAccMag__  
        _variables in the data set:_  
        "tGravityAccMagMean"  
        "tGravityAccMagStd"  

* __tBodyAccJerkMag__  
        _variables in the data set:_  
        "tBodyAccJerkMagMean"  
        "tBodyAccJerkMagStd"  

* __tBodyGyroMag__  
        _variables in the data set:_  
        "tBodyGyroMagMean"  
        "tBodyGyroMagStd"  

* __tBodyGyroJerkMag__  
        _variables in the data set:_  
        "tBodyGyroJerkMagMean"  
        "tBodyGyroJerkMagStd"  

* __fBodyAcc-XYZ__  
        _variables in the data set:_  
        "fBodyAccMeanX" "fBodyAccMeanY" "fBodyAccMeanZ"  
        "fBodyAccStdX" "fBodyAccStdY" "fBodyAccStdZ"  

* __fBodyAccJerk-XYZ__  
        _variables in the data set:_  
        "fBodyAccJerkMeanX" "fBodyAccJerkMeanY" "fBodyAccJerkMeanZ"  
        "fBodyAccJerkStdX" "fBodyAccJerkStdY" "fBodyAccJerkStdZ"  

* __fBodyGyro-XYZ__  
        _variables in the data set:_  
        "fBodyGyroMeanX" "fBodyGyroMeanY" "fBodyGyroMeanZ"  
        "fBodyGyroStdX" "fBodyGyroStdY" "fBodyGyroStdZ"  

* __fBodyAccMag__  
        _variables in the data set:_  
         "fBodyAccMagMean"  
         "fBodyAccMagStd"  

* __fBodyAccJerkMag__  
        _variables in the data set:_  
        "fBodyBodyAccJerkMagMean"  
        "fBodyBodyAccJerkMagStd"  

* __fBodyGyroMag__  
        _variables in the data set:_  
        "fBodyBodyGyroMagMean"  
        "fBodyBodyGyroMagStd"  

* __fBodyGyroJerkMag__  
        _variables in the data set:_  
        "fBodyBodyGyroJerkMagMean"  
        "fBodyBodyGyroJerkMagStd"  
 
_this document uses material from the original "features.txt" -document that accompanies the original dataset._
