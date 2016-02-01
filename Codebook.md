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