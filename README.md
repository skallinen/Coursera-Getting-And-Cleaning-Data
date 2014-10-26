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

The script
----------
1. The script starts checking and loading necesary packages.
2. It checks if the original dataset is in the working directory, if not it either automatically downloads it, or if on a Windows system, stops the script an tells the user to download it manually.
3. Next the script automatically loads and merges the source data files into one data set in R. It starts by loading the training set and merging separate files and then doing the same with the test set and finally rbinding them into one big file. Originally the file loading scrpit was recursive, but that was turned off as the data in subdirectories was not used.
4. The column names are fixed and the dataframe is converted into a tbl_df for easier manipulation.
5. Next the script reads the variable names from the features.txt-file. It adds temporary incremental suffixes to the variablenames as othewise we will get conflicting dublicate variablenames. These names are pushed into the dataframe as variablenames.
6. It then selects only the relevant columns. It recognizes the right variable names by patternmaching 'mean()' and 'std()' from the variablenames. These variables contain the mean and standard deviation calculations for each measurement.
7. Now it adds the activity labels to the activity column. The script does this by using the factor function and creating factor labels for each activity.
8. It prettyfies the variablenames and remove all the temporary characters from them.
9. In the following step the script calculates the averages for set with the average of each variable for each activity and each subject. This is achieved by melting with subject and activity being id's and rest as measurements. The data is then cast with the mean values calculated. 
10. Finally the result is saved to disk in the working directory as tidy_data.txt file.
