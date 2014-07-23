# Getting and Cleaning Data - Course Project

# Load and process datafeeds
datafeed_train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
datafeed_test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
datafeed_train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
datafeed_test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Merge the training and the test sets to create one dataset.
dataset_x <- rbind(datafeed_train_x, datafeed_test_x)
dataset_y <- rbind(datafeed_train_y, datafeed_test_y)
dataset_subj <- rbind(subject_train, subject_test)

# Extract only the measurements on the mean and standard deviation for each measurement.
colnames(dataset_x) <- features[,2]

dataset_mean <- grep("mean()", colnames(dataset_x), fixed=TRUE)
dataset_stddev <- grep("std()", colnames(dataset_x), fixed=TRUE)
dataset_ms <- dataset_x[,c(dataset_mean, dataset_stddev)]

dataset_xy <- cbind(dataset_y, dataset_ms)

#Use descriptive activity names to name the activities in the data set.
colnames(dataset_xy)[1] <- "Activity"

#Appropriately labels the data set with descriptive activity names.
activity_labels[,2] <- as.character(activity_labels[,2])

      for(i in 1:length(dataset_xy[,1])){
            dataset_xy[i,1] <- activity_labels[dataset_xy[i,1],2]
      }

#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
dataset_all <- cbind(dataset_subj, dataset_xy)
colnames(dataset_all)[1] <- "Subject"

dataset_tidy <- aggregate(dataset_all[,3] ~ Subject+Activity, data = dataset_all, FUN= "mean")

      for(i in 4:ncol(dataset_all)){
            dataset_tidy[,i] <- aggregate(dataset_all[,i] ~ Subject+Activity, data = dataset_all, FUN= "mean")[,3]
      }

colnames(dataset_tidy)[3:ncol(dataset_tidy)] <- colnames(dataset_ms)

write.table(dataset_tidy, file = "UCI_HAR_Datafeed.txt")
