library(data.table)
library(dplyr)
library(reshape2)
library(stringr)

#
# Downloads and unzips the data set, if it doesn't already exist. In either
# case, returns the last modified time of the downloaded file as the download
# date.
#
download_data <- function() {
  dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dataset_zipfile <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"

  # If the zip file doesn't exist, download it and unzip it.
  if (!file.exists(dataset_zipfile)) {
    download.file(url = dataset_url, destfile = dataset_zipfile, quiet = TRUE)
    unzip(dataset_zipfile)
  }

  # Return the download date of the zip file, using the file's modified time.
  file.info(dataset_zipfile, extra_cols = F)[["mtime"]]
}

#
# Reads the specified file in the subdirectory "UCS HAR Dataset" of the current
# working directory, using the specified column names and not setting strings
# as factors. Returns a tbl_df.
#
read_tbl_df <- function(file, col.names) {
  tbl_df(fread(paste0("./UCI HAR Dataset/", file),
               col.names = col.names,
               stringsAsFactors = FALSE))
}

#
# Reads the train and test sets for the specified name, using the specified
# column names for each, and row binds the 2 sets, returning a tbl_df of the
# result.
#
# For example, if the value of 'name' is 'subject', reads the following files:
#
#    * train/subject_train.txt
#    * test/subject_test.txt
#
# The returned tbl_df is a result of row binding the contents of the 2 files,
# as if the data from the separate files were read from a single file containing
# all of the data, with all training data appearing before all test data.
#
read_merge_train_test_df <- function(name, col.names) {
  train <- read_tbl_df(paste0("train/", name, "_train.txt"), col.names)
  test  <- read_tbl_df(paste0("test/", name, "_test.txt"), col.names)
  tbl_df(rbind(train, test))
}

# Download the data, if not already downloaded, and take note of the download
# date, whether the data was downloaded now or previously.
downloaded_date <- download_data()

# Read and merge the train and test subject IDs.
subject_df <- read_merge_train_test_df("subject", c("subject"))

# Read and merge the train and test activities, and convert the activity IDs to
# descriptive activity names.
activity_df <- read_tbl_df("activity_labels.txt", c("activity_id", "activity"))
y_df <-
  read_merge_train_test_df("y", c("activity_id")) %>%
  mutate(activity = activity_df$activity[activity_id]) %>%
  select(activity)

# Read feature names from the second column in features.txt
features <- read_tbl_df("features.txt")[[2]]

# Find all of the mean and standard deviation (std) features
mean_std_features <- str_subset(features, "mean|std")

# Read all measurements, keeping only the mean and std features
X_df <- read_merge_train_test_df("X", features)[mean_std_features]

# Merge the subject IDs, activity names, and mean/std measurements into a
# single, tidy data set, computing the mean of each measurment grouped by
# subject, then by activity.
tidy_df <-
  tbl_df(cbind(subject_df, y_df, X_df)) %>%
  melt(id.vars = c("subject", "activity")) %>%
  dcast(subject + activity ~ variable, mean)

write.table(tidy_df, "tidy.txt", row.names = FALSE)
