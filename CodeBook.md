# Code Book for run_analysis.R script

## Data

### Input

* x_test.txt and x_train.txt files contain measurements values for the experiment

* y_test.txt and y_train.txt files contain corresponding activity labels as follows:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. STANDING
5. SITTING
6. LAYING

* subject_test.txt and subject_train.txt files contain subject IDs of experiment participants (1-30)

* features.txt file contains signal measurements labels



### Output

File tidy_dataset.txt contains a tidy dataset of merged training and test sets

## Variables

1. subjects (1-30, subject_test.txt and subject_train.txt files)
2. activities (1-6, see section Data above)
3. measurements (features.txt file)

## Transformations

1. Measurements labels from features.txt file had been assigned to values in x_test.txt and x_train.txt files
2. Activity IDs from y_test.txt and y_train.txt files were added to x_test and x_train datasets
3. Subject IDs from subject_test.txt and subject_train.txt files were added to x_test and x_train datasets
4. Measurements labels were made more descriptive
5. Train and test datasets were merged to create final tidy dataset which was written to tidy_dataset.txt file
