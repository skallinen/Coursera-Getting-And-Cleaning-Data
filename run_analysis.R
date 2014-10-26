## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#===============================================================================================
# Load packages
#===============================================================================================
if(!require(dplyr)){install.packages("dplyr")}
library(dplyr)

if(!require(reshape2)){install.packages("reshape2")}
library(reshape2)

#===============================================================================================
# Download files, if on *nix system
#===============================================================================================
if(!file.exists("UCI HAR Dataset")){
        if (Sys.info()["sysname"] == "Linux" | Sys.info()["sysname"] == "Darwin") {
                system("curl -sS https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip > dataset.zip && unzip dataset.zip && rm dataset.zip")
        } else {
                stop("Please download the dataset zip archive and extract it to the working directory... https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
        }
}

#===============================================================================================
# 1. Reads the files. Merges the training and the test sets to create one data set.
#===============================================================================================

## Read file function
readFiles <- function(files){
        df <- data.frame()
        for (file in files) {
                file <- file.path(file)
                t <- read.table(file, header=F)
                if (length(df) == 0 ) {
                        df <- t
                } else {
                        df <- cbind(df, t) 
                }
                
        }
        df
}

## build the first df
dataset <- c("./UCI HAR Dataset/test", "./UCI HAR Dataset/train")
files <- list.files(path=dataset[1], pattern="*.txt", full.names=T, recursive=F)
data <- readFiles(files)
files <- list.files(path=dataset[2], pattern="*.txt", full.names=T, recursive=F)
data <- rbind(data, readFiles(files))


## change the df into tbl_df, fix names
tidy_data <- tbl_df(data)
names(tidy_data)[1] <- "subject"
names(tidy_data)[length(tidy_data)] <- "activity"

## read the feature variable names
file <- file.path("./UCI HAR Dataset/features.txt")
features <- read.table(file, header=F, stringsAsFactors = F) %>% tbl_df() %>% select(V2)

## add an incremental suffix since several duplicatesnames exists
for (i in 1:length(features$V2)){
        features$V2[i] <- paste(features$V2[i], formatC(i, width=3, flag="0"), sep ="_")
}
## attach the variable names to the dataset
names(tidy_data)[2:562] <- features$V2


#===============================================================================================
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#===============================================================================================
tidy_data <- select(tidy_data, subject, activity, contains("mean()"), contains("std()"))

#===============================================================================================
# 4. Uses descriptive activity names to name the activities in the data set
#===============================================================================================
tidy_data$activity <- factor(tidy_data$activity,
                 levels = c(1:6),
                 labels = c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Tidies the variablenames
for (i in 3:length(names(tidy_data))) {
        names(tidy_data)[i]  <- gsub("[^[:alpha:] ]", "", names(tidy_data)[i])
        names(tidy_data)[i]  <- gsub("mean", "Mean", names(tidy_data)[i])
        names(tidy_data)[i]  <- gsub("std", "Std", names(tidy_data)[i])
}

#===============================================================================================
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
#===============================================================================================
tidyMelt <- melt(tidy_data,id=c("subject","activity"),measure.vars=c(names(tidy_data)[3:length(names(tidy_data))]))
tidy_data <- dcast(tidyMelt, subject + activity ~ variable, mean)

## saves the tidy file to disk
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)
