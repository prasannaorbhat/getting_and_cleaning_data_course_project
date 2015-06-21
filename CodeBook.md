# Logics used to solve the problem are documented here 
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

