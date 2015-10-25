# Code Book

## Raw Data

The following files contain the raw data used for this project:

- `features.txt`: List of all features
- `activity_labels.txt`: Links the class labels (y) with their activity name
- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- `train/X_train.txt`: Training set
- `train/y_train.txt`: Training labels (1 to 6)
- `test/subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- `test/X_test.txt`: Test set
- `test/y_test.txt`: Test labels (1 to 6)

## Tidy Data

The tidy data generated from the raw data is written to `tidy.txt`. The tidy data set consists of the following columns:

1. `subject`: subject ID (from 1 to 30)
1. `activity`: name of the activity performed (`LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`)
1. All of the features that are measurements of the mean and standard deviation for each measurement (there are 79). The descriptions of these variables are given in `features.txt`

The transformations performed on the raw data to obtain the tidy data are as follows:

1. Merge the training and test sets to create one data set.
1. Convert class labels (y) to their equivalent activity names
1. Extract only the measurements (X) on the mean and standard deviation for each measurement
1. Create a one data set containing the subject IDs, activity names (labels), and extracted measurements
1. Compute the average of each variable for each subject and activity

