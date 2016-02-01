# Here, both run_analysis.R & "UCI HAR Dataset" are in same directory
require(reshape2)

# Steps 1 & 3 of the assignment
# a) Combining the training and the test sets  
# b) By merging with Activity Labels, 
#    Descriptive Labels for activities are ensured
combine_whole_data <- function(dir) {
   
    # Get the X data of train and test sets
    path <- paste(".", dir, "train/X_train.txt", sep="/")
    X_train <- read.table(path)
    path <- paste(".", dir, "test/X_test.txt", sep="/")
    X_test <- read.table(path)
    
    # Get the activity labels
    path <- paste(".", dir, "activity_labels.txt", sep="/")
    activity_labels <- read.table(path)
    
    # Get the subject labels of train and test sets
    path <- paste(".", dir, "train/subject_train.txt", sep="/")
    subject_train <- read.table(path)
    path <- paste(".", dir, "test/subject_test.txt", sep="/")
    subject_test <- read.table(path)
    
    # Get the y data of train and test sets 
    path <- paste(".", dir, "train/y_train.txt", sep="/")
    y_train <- read.table(path)
    path <- paste(".", dir, "test/y_test.txt", sep="/")
    y_test <- read.table(path)
    
    # Merge y train and test data with activity labels
    # Descriptive Labels for Activities
    y_train_labels <- merge(y_train, activity_labels, by="V1")
    y_test_labels <- merge(y_test, activity_labels, by="V1")
    
    # Bind the columns of test and training data separately
    train_data <- cbind(subject_train,y_train_labels,X_train)
    test_data <- cbind(subject_test,y_test_labels,X_test)
    
    # Bind the rows of train and test data
    whole_data <- rbind(train_data, test_data)
    
    return (whole_data)
}

# Step 2 of the assignment
# a) Selecting only the the mean and standard deviation columns of each measurement
select_mean_stddev <- function(data_set, directory) {
    
    path <- paste(".", directory, "features.txt", sep="/")
    features_data <- read.table(path)
    
    # For data.table, V1 -> column number & V2 -> column name
    # subsetting the rows with the name mean and std
    mean_std_rows <- subset(features_data,  grepl("(mean\\(\\)|std\\(\\))", features_data$V2) )
    
    # setting the column names of whole data with Subject, Activity_Id, Activity
    colnames(data_set) <- c("Subject","Activity_Id","Activity",as.vector(features_data[,2]))
    
    # Get the data with column names mean or std
    mean_columns <- grep("mean()", colnames(data_set), fixed=TRUE)
    std_columns <- grep("std()", colnames(data_set), fixed=TRUE)
    
    # put both mean and std columns into single vector
    mean_std_column_vector <- c(mean_columns, std_columns)
    
    # Select the mean and std columns   
    selected_data_set <- data_set[,c(1,2,3,mean_std_column_vector)]
    return (selected_data_set)
}

# Step 4 of the assignment
# a) Using Descriptive Variable Names in the Columns
assign_descriptive_var_names <- function(columnNames) {
    
    columnNames <- gsub("^t", "Time.", columnNames)
    columnNames <- gsub("^f", "FFT.", columnNames)
    
    columnNames <- gsub("Acc", "Acceleration", columnNames)
    columnNames <- gsub("Mag", "Magnitude", columnNames)
    columnNames <- gsub("Freq", "Frequency", columnNames)
    
    columnNames <- gsub("\\-mean\\(\\)\\-", ".Mean.", columnNames)
    columnNames <- gsub("\\-std\\(\\)\\-", ".Std.", columnNames)
    
    columnNames <- gsub("\\-mean\\(\\)", ".Mean", columnNames)
    columnNames <- gsub("\\-std\\(\\)", ".Std", columnNames)
    
    return(columnNames)
}

# Step 5 of the assignment 
# a) Produces tidy data having averages of each measurement per activity per subject
produce_tidy_set <- function(data_set, tidyset_file) {

    #melt the data
    melted_data <- melt(data_set, id=c("Subject","Activity_Id","Activity"))
    
    # cast the data
    tidy_data <- dcast(melted_data, formula = Subject + Activity_Id + Activity ~ variable, mean)
    
    # write the output into a file
    write.table(tidy_data, file=tidyset_file, sep="\t", row.names=FALSE)
}


# Driving Code: Things start here

data_dir <- "UCI HAR Dataset"
#Step 1 & 3:
whole_data <- combine_whole_data(data_dir)

#Step 2:
mean_stddev_data <- select_mean_stddev(whole_data, data_dir)

#Step 4:
names(mean_stddev_data) <- assign_descriptive_var_names(names(mean_stddev_data))

#Step 5:
produce_tidy_set(mean_stddev_data, "./tidy.txt")
