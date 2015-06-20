# Getting and Cleaning Data Project

This is the project of the Getting and Cleaning Data course. The contents of
this directory are the Samsung data (inside "UCI HAR Dataset"), the
**run_analysis.R** script, the output data (in **tidy_dataset.txt**) and a
code book describing the variables.

## The script

The script requires the **dplyr** package, and is divided in 6 sections. It
includes many comments, but a summary of its behavior is provided here.

### 0: Read the files

It first reads the activity labels and features and store them as data frames.
Then, for both the "train" and "test" datasets, it reads the list of subjects
and activity labels, merges the activity labels with descriptive activity
names, reads the actual train or test data set and then binds it with the list
of subjects and activities to create the datasets `testData` and `trainData`.

### 1: Merge the training and the test sets to create one data set

In this section, the script simply merges the two `testData` and `trainData`
data frames into a single one named `dataset`.

### 2: Extract only the measurements on the mean and standard deviation for each measurement

The script uses the `select` function from **dplyr** to exctract all variables
that contain the word "mean" or "std".

### 3: Use descriptive activity names to name the activities in the data set

Nothing is done here, at this was already achieved in section 0.

### 4: Appropriately labels the data set with descriptive variable names

In this section, regular expressions are used to modify the variable names in
order to make them more readable, eg by using full words ("Acceleration"
instead of "Acc") and writting ".Mean" or ".StdDev" at the end of the variable
name.

### 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

To achieve the desired tidy data set, the script uses `group_by` and
`summarise_each` to create a new data frame named `by_subject_activity`, which
is finally writting into the file **tidy_dataset.txt**.
