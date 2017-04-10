# Codebook - Getting And Cleaning Data Assignment
### Geoff Skellams - 2017

## Variable Definitions

The table below describes all of the variable names in the tidy dataset. All variables in this dataset are actually the **mean** of the set of corresponding factors in the original data set.

The **Original Factor Name** column refers to the name of the factor in the original data set.

| Variable Name | Description | Units | Original Factor Name |
|---------------|-------------|-------|----------------------|
| activity | Human readable form of the activity being measured | NA | NA |
| subject | Number of the subject performing the experiment | NA | NA |
| tBodyAcc_X.mean | Mean of the mean of the X-axis component of the Body Accelerometer time signals | standard gravity units 'g' | tBodyAcc-mean()-X |
| tBodyAcc_Y.mean | Mean of the mean of the Y-axis component of the Body Accelerometer time signals | standard gravity units 'g' | tBodyAcc-mean()-Y |
| tBodyAcc_Z.mean | Mean of the mean of the Z-axis component of the Body Accelerometer time signals | standard gravity units 'g' | tBodyAcc-mean()-Z |
| tBodyAcc_X.std | Mean of the standard deviation of the X-axis component of the Body Accelerometer time signals | standard gravity units 'g' | tBodyAcc-std()-X |
| tBodyAcc_Y.std | Mean of the standard deviation of the Y-axis component of the Body Accelerometer time signals | standard gravity units 'g' | tBodyAcc-std()-Y |
| tBodyAcc_Z.std | Mean of the standard deviation of the Z-axis component of the Body Accelerometer time signals | standard gravity units 'g' | tBodyAcc-std()-Z |
| tGravityAcc_X.mean | Mean of the mean of the X-axis component of the Gravity Accelerometer time signals | standard gravity units 'g' | tGravityAcc-mean()-X |
| tGravityAcc_Y.mean | Mean of the mean of the Y-axis component of the Gravity Accelerometer time signals | standard gravity units 'g' | tGravityAcc-mean()-Y |
| tGravityAcc_Z.mean | Mean of the mean of the Z-axis component of the Gravity Accelerometer time signals | standard gravity units 'g' | tGravityAcc-mean()-Z |
| tGravityAcc_X.std | Mean of the standard deviation of the X-axis component of the Gravity Accelerometer time signals | standard gravity units 'g' | tGravityAcc-std()-X |
| tGravityAcc_Y.std | Mean of the standard deviation of the Y-axis component of the Gravity Accelerometer time signals | standard gravity units 'g' | tGravityAcc-std()-Y |
| tGravityAcc_Z.std | Mean of the standard deviation of the Z-axis component of the Gravity Accelerometer time signals | standard gravity units 'g' | tGravityAcc-std()-Z |
| tBodyAccJerk_X.mean | Mean of the mean of the X-axis component of the Body Linear Acceleration Jerk time signals | standard gravity units 'g' | tBodyAccJerk-mean()-X |
| tBodyAccJerk_Y.mean | Mean of the mean of the Y-axis component of the Body Linear Acceleration Jerk time signals | standard gravity units 'g' | tBodyAccJerk-mean()-Y |
| tBodyAccJerk_Z.mean | Mean of the mean of the Z-axis component of the Body Linear Acceleration Jerk time signals | standard gravity units 'g' | tBodyAccJerk-mean()-Z |
| tBodyAccJerk_X.std | Mean of the standard deviation of the X-axis component of the Body Linear Acceleration Jerk time signals | standard gravity units 'g' | tBodyAccJerk-std()-X |
| tBodyAccJerk_Y.std | Mean of the standard deviation of the Y-axis component of the Body Linear Acceleration Jerk time signals | standard gravity units 'g' | tBodyAccJerk-std()-Y |
| tBodyAccJerk_Z.std | Mean of the standard deviation of the Z-axis component of the Body Linear Acceleration Jerk time signals | standard gravity units 'g' | tBodyAccJerk-std()-Z |
| tBodyGyro_X.mean | Mean of the mean of the X-axis component of the Body Angular Velocity time signals | radians/sec | tBodyGyro-mean()-X |
| tBodyGyro_Y.mean | Mean of the mean of the Y-axis component of the Body Angular Velocity time signals | radians/sec | tBodyGyro-mean()-Y |
| tBodyGyro_Z.mean | Mean of the mean of the Z-axis component of the Body Angular Velocity time signals | radians/sec | tBodyGyro-mean()-Z |
| tBodyGyro_X.std | Mean of the standard deviation of the X-axis component of the Body Angular Velocity time signals | radians/sec | tBodyGyro-std()-X |
| tBodyGyro_Y.std | Mean of the standard deviation of the Y-axis component of the Body Angular Velocity time signals | radians/sec | tBodyGyro-std()-Y |
| tBodyGyro_Z.std | Mean of the standard deviation of the Z-axis component of the Body Angular Velocity time signals | radians/sec | tBodyGyro-std()-Z |
| tBodyGyroJerk_X.mean | Mean of the mean of the X-axis component of the Body Angular Velocity Jerk time signals | radians/sec | tBodyGyroJerk-mean()-X |
| tBodyGyroJerk_Y.mean | Mean of the mean of the Y-axis component of the Body Angular Velocity Jerk time signals | radians/sec | tBodyGyroJerk-mean()-Y |
| tBodyGyroJerk_Z.mean | Mean of the mean of the Z-axis component of the Body Angular Velocity Jerk time signals | radians/sec | tBodyGyroJerk-mean()-Z |
| tBodyGyroJerk_X.std | Mean of the standard deviation of the X-axis component of the Body Angular Velocity Jerk time signals | radians/sec | tBodyGyroJerk-std()-X |
| tBodyGyroJerk_Y.std | Mean of the standard deviation of the Y-axis component of the Body Angular Velocity Jerk time signals | radians/sec | tBodyGyroJerk-std()-Y |
| tBodyGyroJerk_Z.std | Mean of the standard deviation of the Z-axis component of the Body Angular Velocity Jerk time signals | radians/sec | tBodyGyroJerk-std()-Z |
| tBodyAccMag.mean | Mean of the mean of the Body Linear Acceleration Euclidean norm magnitude | standard gravity units 'g' | tBodyAccMag-mean() |
| tBodyAccMag.std | Mean of the standard deviation of the Body Linear Acceleration Euclidean norm magnitude | standard gravity units 'g' | tBodyAccMag-std() |
| tGravityAccMag.mean | Mean of the mean of the Gravity Acceleration Euclidean norm magnitude | standard gravity units 'g' | tGravityAccMag-mean() |
| tGravityAccMag.std | Mean of the standard deviation of the Gravity Acceleration Euclidean norm magnitude | standard gravity units 'g' | tGravityAccMag-std() |
| tBodyAccJerkMag.mean | Mean of the mean of the Body Linear Acceleration Jerk Euclidean norm magnitude | standard gravity units 'g' | tBodyAccJerkMag-mean() |
| tBodyAccJerkMag.std | Mean of the standard deviation of the Body Linear Acceleration Jerk Euclidean norm magnitude | standard gravity units 'g' | tBodyAccJerkMag-std() |
| tBodyGyroMag.mean | Mean of the mean of the Body Angular Velocity Euclidean norm magnitude | radians/sec | tBodyGyroMag-mean() |
| tBodyGyroMag.std | Mean of the standard deviation of the Body Angular Velocity Euclidean norm magnitude | radians/sec | tBodyGyroMag-std() |
| tBodyGyroJerkMag.mean | Mean of the mean of the Body Angular Velocity Jerk Euclidean norm magnitude | radians/sec | tBodyGyroJerkMag-mean() |
| tBodyGyroJerkMag.std | Mean of the standard deviation of the Body Angular Velocity Jerk Euclidean norm magnitude | radians/sec | tBodyGyroJerkMag-std() |
| fBodyAcc_X.mean | Mean of the mean of the X-axis component of the Body Accelerometer Fast Fourier Transform | standard gravity units 'g' | fBodyAcc-mean()-X |
| fBodyAcc_Y.mean | Mean of the mean of the Y-axis component of the Body Accelerometer Fast Fourier Transform | standard gravity units 'g' | fBodyAcc-mean()-Y |
| fBodyAcc_Z.mean | Mean of the mean of the Z-axis component of the Body Accelerometer Fast Fourier Transform | standard gravity units 'g' | fBodyAcc-mean()-Z |
| fBodyAcc_X.std | Mean of the standard deviation of the X-axis component of the Body Accelerometer Fast Fourier Transform | standard gravity units 'g' | fBodyAcc-std()-X |
| fBodyAcc_Y.std | Mean of the standard deviation of the Y-axis component of the Body Accelerometer Fast Fourier Transform | standard gravity units 'g' | fBodyAcc-std()-Y |
| fBodyAcc_Z.std | Mean of the standard deviation of the Z-axis component of the Body Accelerometer Fast Fourier Transform | standard gravity units 'g' | fBodyAcc-std()-Z |
| fBodyAccJerk_X.mean | Mean of the mean of the X-axis component of the Body Accelerometer Jerk Fast Fourier Transform | standard gravity units 'g' | fBodyAccJerk-mean()-X |
| fBodyAccJerk_Y.mean | Mean of the mean of the Y-axis component of the Body Accelerometer Jerk Fast Fourier Transform | standard gravity units 'g' | fBodyAccJerk-mean()-Y |
| fBodyAccJerk_Z.mean | Mean of the mean of the Z-axis component of the Body Accelerometer Jerk Fast Fourier Transform | standard gravity units 'g' | fBodyAccJerk-mean()-Z |
| fBodyAccJerk_X.std | Mean of the standard deviation of the X-axis component of the Body Accelerometer Jerk Fast Fourier Transform | standard gravity units 'g' | fBodyAccJerk-std()-X |
| fBodyAccJerk_Y.std | Mean of the standard deviation of the Y-axis component of the Body Accelerometer Jerk Fast Fourier Transform | standard gravity units 'g' | fBodyAccJerk-std()-Y |
| fBodyAccJerk_Z.std | Mean of the standard deviation of the Z-axis component of the Body Accelerometer Jerk Fast Fourier Transform | standard gravity units 'g' | fBodyAccJerk-std()-Z |
| fBodyGyro_X.mean | Mean of the mean of the X-axis component of the Body Angular Velocity Fast Fourier Transform | radians/sec | fBodyGyro-mean()-X |
| fBodyGyro_Y.mean | Mean of the mean of the Y-axis component of the Body Angular Velocity Fast Fourier Transform | radians/sec | fBodyGyro-mean()-Y |
| fBodyGyro_Z.mean | Mean of the mean of the Z-axis component of the Body Angular Velocity Fast Fourier Transform | radians/sec | fBodyGyro-mean()-Z |
| fBodyGyro_X.std | Mean of the standard deviation of the X-axis component of the Body Angular Velocity Fast Fourier Transform | radians/sec | fBodyGyro-std()-X |
| fBodyGyro_Y.std | Mean of the standard deviation of the Y-axis component of the Body Angular Velocity Fast Fourier Transform | radians/sec | fBodyGyro-std()-Y |
| fBodyGyro_Z.std | Mean of the standard deviation of the Z-axis component of the Body Angular Velocity Fast Fourier Transform | radians/sec | fBodyGyro-std()-Z |
| fBodyAccMag.mean | Mean of the mean the Body Accelerometer Euclidean norm magnitude Fast Fourier Transform | standard gravity units 'g' | fBodyAccMag-mean() |
| fBodyAccMag.std | Mean of the standard deviation of the Body Accelerometer Euclidean norm magnitude Fast Fourier Transform | standard gravity units 'g' | fBodyAccMag-std() |
| fBodyBodyAccJerkMag.mean | Mean of the mean of the Body Accelerometer Jerk Euclidean norm magnitude Fast Fourier Transform | standard gravity units 'g' | fBodyBodyAccJerkMag-mean() |
| fBodyBodyAccJerkMag.std | Mean of the standard deviation of the Body Accelerometer Jerk Euclidean norm magnitude Fast Fourier Transform | standard gravity units 'g' | fBodyBodyAccJerkMag-std() |
| fBodyBodyGyroMag.mean | Mean of the mean of the Body Angular Velocity Euclidean norm magnitude Fast Fourier Transform | radians/sec | fBodyBodyGyroMag-mean() |
| fBodyBodyGyroMag.std | Mean of the standard deviation of the Body Angular Velocity Euclidean norm magnitude Fast Fourier Transform | radians/sec | fBodyBodyGyroMag-std() |
| fBodyBodyGyroJerkMag.mean | Mean of the mean of the Body Angular Velocity Jerk Euclidean norm magnitude Fast Fourier Transform | radians/sec | fBodyBodyGyroJerkMag-mean() |
| fBodyBodyGyroJerkMag.std | Mean of the standard deviation of the Body Angular Velocity Jerk Euclidean norm magnitude Fast Fourier Transform | radians/sec | fBodyBodyGyroJerkMag-std() |


