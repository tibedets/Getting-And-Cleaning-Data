#####
# Coursera Getting and Cleaning Data Course Project
# run_analysis.r File Description:
# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#####
file <- "data.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path <- "UCI HAR Dataset"
result_folder <- "data"
#####plyr
if(!is.element("plyr", installed.packages()[,1])){
        print("Installing packages")
        install.packages("plyr")
}
library(plyr)
##### data and folder  
if(!file.exists(file)){
        download.file(url,file, mode = "wb")
       }

if(!file.exists(result_folder)){
        dir.create(result_folder)
} 

##### make table of data
getTable <- function (filename,cols = NULL){
        f <- unz(file, paste(data_path,filename,sep="/"))
        data <- data.frame()
        if(is.null(cols)){
                data <- read.table(f,sep="",stringsAsFactors=F)
        } else {
                data <- read.table(f,sep="",stringsAsFactors=F, col.names= cols)
        }
        data
        
}

##### Read/create dataset
getData <- function(type, features){
        
        print(paste("Getting Data", type))
        
        subject_data <- getTable(paste(type,"/","subject_",type,".txt",sep=""),"id")
        y_data <- getTable(paste(type,"/","y_",type,".txt",sep=""),"activity")    
        x_data <- getTable(paste(type,"/","X_",type,".txt",sep=""),features$V2) 
        
        return (cbind(subject_data,y_data,x_data)) 
}

#####save the data
saveResult <- function (data,name){
        
        print(paste("Saving Data", name))
        
        file <- paste(result_folder, "/", name,".csv" ,sep="")
        write.csv(data,file)
}
##### get common data tables
##### use features.txt for column names
features <- getTable("features.txt")
##### Load data 
train <- getData("train",features)
test <- getData("test",features)
##########Merges the training and the test sets to create one data set.
data <- rbind(train, test)
data <- arrange(data, id)
##########Uses descriptive activity names to name the activities in the data set 
##########Appropriately labels the data set with descriptive activity names.
activity_labels <- getTable("activity_labels.txt")
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)
##########Extracts only the measurements on the mean and standard deviation for each measurement. 
tidydata <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]
saveResult(tidydata,"tidydata")
##########Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
meantidy <- ddply(tidydata, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(meantidy)[-c(1:2)] <- paste(colnames(meantidy)[-c(1:2)], "_mean", sep="")
saveResult(meantidy,"meantidy")
