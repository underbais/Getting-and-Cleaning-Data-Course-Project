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

