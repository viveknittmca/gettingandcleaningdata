# Description

## Steps/Requirement:
 - 1. Merges the training and the test sets to create one data set.
 - 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 - 3. Uses descriptive activity names to name the activities in the data set
 - 4. Appropriately labels the data set with descriptive variable names.
 - 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
      each variable for each activity and each subject.

## Functions
 - `combine_whole_data` takes care of Step 1 & 3
 - `select_mean_stddev` takes care of Step 2
 - `assign_descriptive_var_names` takes care of Step 4
 - `produce_tidy_set` takes care of Step 5


## Step 1 & 3:
### combine_whole_data: Merge both train and test data from different input files into one data table. 
 #### Input Params: 
    `dir`: relative path of the data set directory w.r.t run_analysis.R script containing directory
    
 #### Output:
    `whole_data`: single data table having train and test data  
                  It has 3 columns for subject, activity id and activity. 
                  This has 10K+ observations of 550+ variables

## Step2:    
### select_mean_stddev : Subsetting the data set of whole data to get only the mean and standard deviation features
 #### Input Params: 
    `data_set`: data set obtained from the function 'combine_whole_data'
    `directory`: relative path of the data set directory w.r.t 'run_analysis.R' script containing directory
    
 #### Output:
    `selected_data_set`: This data set has all the observations in whole data BUT only the mean and std dev columns 
                         along with subject, activity id and activity.

## Step 4:
### assign_descriptive_var_names : Labels the data set with descriptive variable names
  #### Input Params: 
    `columnNames` : The column names of the whole data set obtained from funtion 'select_mean_stddev'
     
  #### Output: 
    `columnNames` : The words in column names renamed to Time,  FFT, Accelearation, Magnitude, Frequency, Mean , Std
    
    
## Step 5:   
### produce_tidy_set : melts the data, casts it to tidy data, and then dumps the output using write.table
 #### Input Params: 
    `data_set`    : data set obtained from the function 'select_mean_stddev' 
                    with column names renamed using 'assign_descriptive_var_names'
    `tidyset_file`: name  of output file './tidy.txt'
    
 #### Output:
     Table written as 'tidy.txt' in the current working directory
    
