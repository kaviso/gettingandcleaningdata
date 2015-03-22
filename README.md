# gettingandcleaningdata
This contains my course project for Getting and Cleaning Data in coursera. 

# Objective
The goal is to prepare tidy data that can be used for later analysis.

# Source Data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# How to run this code:
1. set your working directory to the UCI HAR Dataset folder 
2. "run_analysis.R" should also be in your new working folder
3. use source("run_analysis.R") 
4. An output file with the name "tidy_data.txt" with data similar to the .txt file found in this repo will be generated

# Sequence followed by the code:
1. get data from train folder for x,y and subject
2. get data from test folder for x,y and subject
3. merge X data to 1
4. merge Y data to 1
5. merge Subject data to 1
6. get data that contains features
7. clean up the titles
8. get only the mean and the standard deviation columns
9. reduce x_data to contain only the columns we need
10. change the column names of x_data
11. get data that contains activities
12. change column names of y_data to corresponding column names found in activities
13. rename only column of Y data to ACtivity
14. rename only column of subject data to Subject
15. Merge X, y and subject data columns to 1
16. turn activity and subject columns from vectors to factors
17. create the tidy data set
18. persist the tidy data to a txt file
