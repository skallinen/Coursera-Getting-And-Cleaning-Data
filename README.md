Coursera Getting And Cleaning Data Course Assignment
====================================================

Intro
-----
The data set comes from a study about Human Activity Recognition Using Smartphones done in Università degli Studi di Genova by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. The assignment was to create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Content
-------
- This **README.md** document 
- **run_analysis.R** script that tidies the data.
- **CODEBOOK.md**

Set-up
------
If you are on a Mac or on Linux you should be able to just run the script in the folder of your choice and the script will download the data set. If you are on a Windows machine you will need to download the data set manually.

1. Download the zip archive from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract the contents.
3. See to it that resulting folder is called "UCI HAR Dataset" and exists in the same directory as the script.
4. Run the **run_analysis.R** script

The script processes the data and writes the result into "tidy_data.txt"-file in your working document.