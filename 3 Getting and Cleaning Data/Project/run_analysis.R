# This script does the folowing:
# 
# 0. Reads the files.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

library(dplyr)
datasetDir <- "./UCI HAR Dataset"

###############################################################################
## 0. Read the files.

# Get activity labels and reorder factor levels to match ids.
activityLabels <- read.table(
  paste(datasetDir, "activity_labels.txt", sep = "/"),
  col.names = c("ActivityId", "Activity"),
  colClasses = c("integer", "character"))

# Get features.
features <- read.table(
  paste(datasetDir, "features.txt", sep = "/"),
  col.names = c("FeatureId", "Feature"),
  colClasses = c("integer", "character"))

# Read test and train data and create datasets.
for(dataType in c("test", "train")) {
  # Read data.
  subject <- read.table(
    paste(datasetDir, dataType, paste0("subject_", dataType, ".txt"),
          sep = "/"),
    col.names = "Subject",
    colClasses = "integer")
  labels <- read.table(
    paste(datasetDir, dataType, paste0("y_", dataType, ".txt"), sep = "/"),
    col.names = "ActivityId",
    colClasses = "integer")
  labels <- merge(labels, activityLabels) # This uses descriptive activity names
                                          # as asked in the 3rd requirement.
  set <- read.table(
    paste(datasetDir, dataType, paste0("X_", dataType, ".txt"), sep = "/"),
    col.names = features$Feature,
    colClasses = "numeric")
  
  # Create dataset and assing it to testData or trainData.
  assign(paste0(dataType, "Data"), cbind(subject, labels, set))
}

###############################################################################
## 1. Merge the training and the test sets to create one data set.
dataset <- rbind(trainData, testData)

###############################################################################
## 2. Extract only the measurements on the mean and standard deviation for each
##    measurement.
dataset <- select(dataset, Subject, ActivityId, Activity,
                  contains("mean", ignore.case = TRUE),
                  contains("std", ignore.case = TRUE))

###############################################################################
## 3. Use descriptive activity names to name the activities in the data set.
# Already done in step 0 with
# labels <- merge(labels, activityLabels)

###############################################################################
## 4. Appropriately labels the data set with descriptive variable names.
# Let's use some regex.

# First remove extra dots, and dots at the end of the name.
names(dataset) <- gsub("\\.{2,}", ".", names(dataset))
names(dataset) <- sub("\\.+$", "", names(dataset))

# Change to full words.
names(dataset) <- sub("Gyro", "Gyroscope", names(dataset))
names(dataset) <- sub("Acc", "Acceleration", names(dataset))
names(dataset) <- sub("Mag", "Magnitude", names(dataset))

# Remove initial "t", and change "f" to an appended ".Frequency".
names(dataset) <- sub("^t", "", names(dataset))
names(dataset) <- sub("^angle\\.t", "angle.", names(dataset))
names(dataset) <- sub("^f(.+)$", "\\1.Frequency", names(dataset), perl = TRUE)

# Put "mean" and "std" at the end as ".Mean" and ".StdDev"
names(dataset) <- sub("^(.+)\\.mean(.*)$", "\\1\\2.Mean", names(dataset),
                      perl = TRUE)
names(dataset) <- sub("^(.+)\\.std(.*)$", "\\1\\2.StdDev", names(dataset),
                      perl = TRUE)

###############################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

# Group by "Subject" and "Activity".
by_subject_activity <- group_by(dataset, Subject, Activity)

# Apply the mean function to the remaining variables (except "ActivityId).
by_subject_activity <- summarise_each(by_subject_activity, funs(mean),
                                      -ActivityId)

###############################################################################
## Save the dataset.
write.table(by_subject_activity, file = "tidy_dataset.txt", quote = FALSE,
            row.name = FALSE)