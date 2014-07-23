Project for Getting and Cleaning Data
======================================

The R script in the repository processes the folowing:
1) Load and process the datafeeds including the following:
      - Train X Datafeed
      - Train Y Datafeed
      - Test X Datafeed
      - Test Y Datafeed
      - Subjects for the Train Datafeeds
      - Subjects for the Test Datafeeds
      - Datafeed for Activity Labels 
      - Datafeed for Features
      
2) Merge the datafeeds to create one datafeed
      - Merge the Train X Datafeed and the Test X Datafeed
      - Merge the Train Y Datafeed and the Test Y Datafeed

3) Extract only the measurements on the mean and standard deviation for each measurement.

4) Use descriptive activity names to name the activities in the data set.
      - Uses the Subjects for the Train and Test Labels to input the appropriate labels.

5) Appropriately labels the data set with descriptive activity names.
      - Uses the Datafeed for Activity Labels to input the appropriate labels.

6) Create a second, independent tidy data set with the average of each variable for each activity and each subject. The data set that is created is: UCI_HAR_Datafeed.txt.