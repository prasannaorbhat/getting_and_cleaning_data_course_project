# download data from the url using download.file()
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./getdata-projectfiles-UCI HAR Dataset.zip"); # commenting it out

# unzip file using unzip() function
# unzip("./getdata-projectfiles-UCI HAR Dataset.zip") ; # commenting it out to save time


# read subject table from test folderand store it in variable called subject_test

subject_test <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt", header = F)

# read x_test table from test folderand store it in variable called x_test

x_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", header = F)

# read Y_test table from test folderand store it in variable called y_test
y_test <- read.table(file = "./UCI HAR Dataset/test/y_test.txt", header = F)

# read subject table from train folder and store it in variable called subject_train
subject_train <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt", header = F)


# read x_train table from train folder and store it in variable called x_train
x_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt", header = F)

# read y_train table from train folder and store it in variable called y_train
y_train <- read.table(file = "./UCI HAR Dataset/train/y_train.txt", header = F)

# read activity label and store it in variable called activity_labels
activity_labels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt", header = F)

# read features and store in variable called features
features <- read.table(file = "./UCI HAR Dataset/features.txt", header = F)

# transpose features and store in variable called header
header <- t(features)

# subset only column header using subset from header
header1 <- header[2,]

# add Labels and Activity using concatenate functon
header2 <- c("Subject", "ActivityID", header1)

# join the x_train, y_train and subject_train and store in variable called training_data
training_data <- cbind(subject_train, y_train, x_train)

# join the x_test, y_test and subject_test and store in variable called test_data
test_data <- cbind(subject_test, y_test, x_test)

# join train and test data sets using rbind function
mydf <- rbind(training_data, test_data)

# add header2 to test_train using colname function
colnames(mydf) <- header2

# subset columns containing mean and standart deviation using grep command
mydf_mean_std <- mydf[, c("Subject","ActivityID", colnames(mydf)[grepl("mean|std", colnames(mydf))])]

# assign column header to activity labels
colnames(activity_labels) <- c("ActivityID", "ActivityType")

# rename the columns with meaningful names
colnames(mydf_mean_std) <- gsub("Acc", "Accelerometer", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("Gyro", "Gyroscope", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("BodyBody", "Body", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("Mag", "Magnitude", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("^t", "Time", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("^f", "Frequency", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("tBody", "TimeBody", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("-mean", "Mean", colnames(mydf_mean_std), ignore.case = TRUE)
colnames(mydf_mean_std)<- gsub("-std", "STD", colnames(mydf_mean_std), ignore.case = TRUE)
colnames(mydf_mean_std)<- gsub("-freq()", "Frequency", colnames(mydf_mean_std), ignore.case = TRUE)
colnames(mydf_mean_std)<- gsub("angle", "Angle", colnames(mydf_mean_std))
colnames(mydf_mean_std)<- gsub("gravity", "Gravity", colnames(mydf_mean_std))

# merge activity lables and my_mean_std table by activity ID

mydf_mean_std_decoded <- merge(activity_labels,mydf_mean_std, by="ActivityID", all.x = TRUE)

# prepare tidy data grouped by Activity and Subject

library(dplyr)
grouped_mydf <- group_by(mydf_mean_std_decoded,ActivityType,Subject)
# gettign the average for each columns with measurements. grouped by activity and subject
tidy_data_avrg <- summarise_each(grouped_mydf,funs(mean))

# rename columns in tidy data
colnames(tidy_data_avrg)[1] <- "Activity_type"
colnames(tidy_data_avrg)[2] <- "Subject_code"
tidy_data_avrg$ActivityType <- NULL
tidy_data_avrg$Subject <- NULL

# Write output table "tidy_output.txt"
write.table(tidy_data_avrg, file = "tidy_output.txt", row.names=FALSE)



