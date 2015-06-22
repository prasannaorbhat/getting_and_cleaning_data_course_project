# The data, variables and logics used to solve the problem are documented here 

## Description
Course project for getting and cleaning data is performed using data from UCI http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . the purpose of this project is to collect, clean and tidy the data so that it is ready for further analysis

## Source data
The source data on Human Activity Recognition Using Smartphones Dataset for this work was used from this URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
### Information related to data sets
The experiments were carried out with a group of 30 volunteers within an age group of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, authors have captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Step 1: download the data and unzip file
## Step 2: Look at the downloaded files and read the readme file carefully. Get familiar with file and folder structure in the downloaded data
## Step 3: Read the tables and import tables in to R
After setting the source directory for the files, read individual text files mentioned below in to tables 
•	features.txt
•	activity_labels.txt
•	subject_train.txt
•	x_train.txt
•	y_train.txt
•	subject_test.txt
•	x_test.txt
•	y_test.txt
features.txt file contains 561 variables for this project
activity_labels.txt file contains the labels such as walking, running etc. which is needed to decode the activity IDs

### Information on Attributes
For each record in the dataset it is provided:
•	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
•	Triaxial Angular velocity from the gyroscope.
•	A 561-feature vector with time and frequency domain variables.
•	Its activity label.
•	An identifier of the subject who carried out the experiment.

## Step 4: Join x, y and subject files in training data sets and test data sets separately using cbind function
## Step 5: Merge training and test data sets using rbind function
## Step 6: Name the columns appropriately which acts as main data frame
## Step 7: Extract only columns containing mean and std by subsetting the main data frame
## Step 8: Substitute activity id with activity type such as walking, running etc
## Step 9: Create another dataframe with average of each variable for each activity and subject
Follow tidy data principle to create this data frame
## Ste 10: write the tidy data set in to a table
results are stored in tidy_output.txt: https://github.com/prasannaorbhat/getting_and_cleaning_data_course_project/blob/master/tidy_output.txt
