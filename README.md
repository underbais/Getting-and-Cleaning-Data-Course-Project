# Getting-and-Cleaning-Data-Course-Project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

### This repo contains the following files:

* tidy_dataset.txt, *which is a final tidy data set for this project*
* Readme.md, *which describes the project and how the script is working*
* CodeBook.md, *which outlines the data, variables and transformations done on them*
* run_analysis.R, *which is the script itself*

### Steps to create final tidy data set

1. Download the data and unzip it
2. Read the data into variables
3. Extract activity and participant data
4. Load test and training datasets with mean and standard deviation only
5. Merge training and test datasets
6. Subset to second dataset with means only by activity and participant
7. Write final dataset to tidy_data_set.txt file

*Please see CodeBook.md and comments in run_analysis.R script for more detailed description of data processing steps*
