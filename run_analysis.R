#1. Merge the Training and Test Sets to create one data set
#get data from train folder for x, y and subject
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#get data from test folder for x, y and subject
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#merge X data to 1 
x_data <- rbind(x_train, x_test)

#merge Y data to 1
y_data <- rbind(y_train, y_test)

#merge Subject data to 1
subject_data <- rbind(subject_train,subject_test)

#2. Extract only the measurements on the mean and standard deviation for each measurement
#get data that contains features to get started
features = read.csv("features.txt", sep="", header=FALSE)
#clean up the titles (Mean and Std only)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#identify the mean and std columns
mean_and_std <- grep(".*Mean.*|.*Std.*", features[,2])

#reduce x_data to contain only the columns we need
x_data <- x_data[, mean_and_std]

#change the column names of x_data to corresponding column names found in features for mean and std only
names(x_data) <- features[mean_and_std,2]

#3. Uses descriptive activity names to name the activities in the data set
#get data that contains activities to get started 
activity_labels = read.csv("activity_labels.txt",sep="", header=FALSE)

#change the column names of y_data to corresponding column names found in activity_labels
y_data[,1] <- activity_labels[y_data[,1],2]

#4. Appropriately labels the data set with descriptive variable names. 
#Rename only column of Y data to Activity
names(y_data) <- "Activity"
#Rename only column of subject_data to Subject
names(subject_data) <- "Subject"

#Extra Step: Merging all the 3 (x_data,y_data, and subject_data) separate data sets to 1
merged_data <- cbind(x_data,y_data,subject_data)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#turn activity and subject from vectors to factors
merged_data$Activity <- as.factor(merged_data$Activity)
merged_data$Subject <- as.factor(merged_data$Subject)

#create the tidy data set 
tidy_data = aggregate(merged_data,by=list(activity = merged_data$Activity,subject=merged_data$Subject),mean)

#taking out the last 2 columns because there are no means for Subject and Activity
tidy_data[,90] = NULL
tidy_data[,89] = NULL

#persisting the data
write.table(tidy_data,"tidy_data.txt",row.name=FALSE)
















