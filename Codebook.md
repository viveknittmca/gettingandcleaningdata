# CodeBook
Description: A code book describing the variables, the data, and any transformations or work that was performed 
             to clean up the data 

## Data

   The zipped file is unzipped into the current working directory as 'UCI HAR Dataset'. 
   i.e the directory of `run_analysis.R`
   
   30 volunteers performed 6 different activities wearing a Samsung Smart phone.
   The smartphone sensors recorded various data about their movements.
   
   The input data contains mean and std of various measurements per subject per activity performed. 

### Files:
   The following are the files which were part of Input data:
   - features.txt: Variable Names of the 550+ features.
   - activity_labels.txt: Names and IDs of 6 activities.
   - X_train.txt: 7K+ observations of the 550+ features for 21/30 volunteers.
   - y_train.txt: A integer vector of 7K+ having the ID of the activity for the observations in X_train.txt.
   - subject_train.txt: A integer vector of 7K+ entities having the subject ID for the  observations in training set.
   - X_test.txt: Around 3K observations of the same 550+ features for 9/30 volunteers.
   - y_test.txt: A integer vector of around 3K entities having the ID of the activities for the observations in X_test.txt.
   - subject_test.txt: A integer vector of around 3K entities having subject ID for the observations in test set: 
   
## Variables

### TIDY DATA:

It contains 69 columns as follows:

* "Subject"     : ID number of the volunteer upon whom the experiment was performed
* "Activity_Id" : ID number for each of the activities listed in the order under "Activity"	
* "Activity"    :  6 different activities which the volunteer carried out.
                    (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
                
* The average of (mean and standard deviation) of the list of variables measured during the experiment
* "Time.BodyAcceleration.Mean.X"
* "Time.BodyAcceleration.Mean.Y"
* "Time.BodyAcceleration.Mean.Z"
* "Time.GravityAcceleration.Mean.X"
* "Time.GravityAcceleration.Mean.Y"
* "Time.GravityAcceleration.Mean.Z"
* "Time.BodyAccelerationJerk.Mean.X"
* "Time.BodyAccelerationJerk.Mean.Y"
* "Time.BodyAccelerationJerk.Mean.Z"
* "Time.BodyGyro.Mean.X"
* "Time.BodyGyro.Mean.Y"
* "Time.BodyGyro.Mean.Z"
* "Time.BodyGyroJerk.Mean.X"
* "Time.BodyGyroJerk.Mean.Y"
* "Time.BodyGyroJerk.Mean.Z"
* "Time.BodyAccelerationMagnitude.Mean"
* "Time.GravityAccelerationMagnitude.Mean"
* "Time.BodyAccelerationJerkMagnitude.Mean"
* "Time.BodyGyroMagnitude.Mean"
* "Time.BodyGyroJerkMagnitude.Mean"
* "FFT.BodyAcceleration.Mean.X"
* "FFT.BodyAcceleration.Mean.Y"
* "FFT.BodyAcceleration.Mean.Z"
* "FFT.BodyAccelerationJerk.Mean.X"
* "FFT.BodyAccelerationJerk.Mean.Y"
* "FFT.BodyAccelerationJerk.Mean.Z"
* "FFT.BodyGyro.Mean.X"
* "FFT.BodyGyro.Mean.Y"
* "FFT.BodyGyro.Mean.Z"
* "FFT.BodyAccelerationMagnitude.Mean"
* "FFT.BodyBodyAccelerationJerkMagnitude.Mean"
* "FFT.BodyBodyGyroMagnitude.Mean"
* "FFT.BodyBodyGyroJerkMagnitude.Mean"
* "Time.BodyAcceleration.Std.X"
* "Time.BodyAcceleration.Std.Y"
* "Time.BodyAcceleration.Std.Z"
* "Time.GravityAcceleration.Std.X"
* "Time.GravityAcceleration.Std.Y"
* "Time.GravityAcceleration.Std.Z"
* "Time.BodyAccelerationJerk.Std.X"
* "Time.BodyAccelerationJerk.Std.Y"
* "Time.BodyAccelerationJerk.Std.Z"
* "Time.BodyGyro.Std.X"
* "Time.BodyGyro.Std.Y"
* "Time.BodyGyro.Std.Z"
* "Time.BodyGyroJerk.Std.X"
* "Time.BodyGyroJerk.Std.Y"
* "Time.BodyGyroJerk.Std.Z"
* "Time.BodyAccelerationMagnitude.Std"
* "Time.GravityAccelerationMagnitude.Std"
* "Time.BodyAccelerationJerkMagnitude.Std"
* "Time.BodyGyroMagnitude.Std"
* "Time.BodyGyroJerkMagnitude.Std"
* "FFT.BodyAcceleration.Std.X"
* "FFT.BodyAcceleration.Std.Y"
* "FFT.BodyAcceleration.Std.Z"
* "FFT.BodyAccelerationJerk.Std.X"
* "FFT.BodyAccelerationJerk.Std.Y"
* "FFT.BodyAccelerationJerk.Std.Z"
* "FFT.BodyGyro.Std.X"
* "FFT.BodyGyro.Std.Y"
* "FFT.BodyGyro.Std.Z"
* "FFT.BodyAccelerationMagnitude.Std"
* "FFT.BodyBodyAccelerationJerkMagnitude.Std"
* "FFT.BodyBodyGyroMagnitude.Std"
* "FFT.BodyBodyGyroJerkMagnitude.Std"


The above variables are mean and standard deviation of the time and frequency measures of 
* Triaxial acceleration(X, Y & Z) from the accelerometer (total acceleration) 
* The estimated body acceleration.
* Magnitude of Gyroscopic Jerk


### combine_whole_data :
   -  X_train: contains the data of 'X_train.txt'
   -  X_test: contains the data of 'X_test.txt'
   -  activity_labels : contains the data of 'activity_labels.txt'
   -  subject_train : contains the data of 'subject_train.txt'
   -  subject_test : contains the data of 'subject_test.txt'
   -  y_train : contains the data of 'y_train.txt'
   -  y_test : contains the data of 'y_test.txt'
   -  y_train_labels : contains the y_train data merged with activity labels
   -  y_test_labels : contains the y_test data merged with activity labels
   -  train_data : contains the entire training data with activity labels
   -  test_data : contains the entire test data with activity labels
   -  whole_data : contains the entire data with activity labels

### select_mean_stddev : 
   - features_data :  contains the data of 'features.txt'
   - mean_std_rows :  contains the features related to mean and standard deviation 
   - mean_columns  :  contains the features related to mean only
   - std_columns   :  contains the features related to  standard deviation only
   - mean_std_column_vector : contains the features related to mean first and then standard deviation 
   - selected_data_set      : contains the data with Subject, Activity Id and Activity as well Mean and Std Dev for them

### produce_tidy_set:
   - melted_data : data melted for columns "Subject", "Activity_Id" & "Activity"
   - tidy_data   : melted data is casted and stored in this variable
   

## Transformations 

   - The 'UCI HAR Dataset' contains  both train and test set.
   - By running 'run_analysis.R' script only the columns containing Mean and Standard Deviation data were taken into account.
   - Please refer 'README.md' for more on how 'run_analysis.R' script does the transformation.
   - The final data contains the Mean & Standard observations at per subject per activity level. 
   - The words in column names were renamed to Time,  FFT, Accelearation, Magnitude, Frequency, Mean , Std
