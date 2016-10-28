---
title: "Codebook.md"
author: "Thaddeus Brown"
date: "October 23, 2016"
output: html_document
---
# Code book
##### Working with data #####
Description of the run_analytics.R process

Load/install library `plyr`
Downloads required data 
	(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Creates data folder
Loads `features.txt` -- used for columns
Loads and appends train dataset using `X_train.txt`(data), `y_train.txt`(labels), `subject_train.txt`(ids)
Loads and appends test dataset using `X_test.txt`(data), `y_test.txt`(labels), `subject_test.txt`(ids)
Appends train and test data
Rearrange the data using ids
Loading activity labels `activity_labels.txt`
Changes the data activity row to use the activity labels
Extracts the `mean`,`std` into dataset1
Saves into `data/tidydata.csv`
Uses plur to calculate mean on activity for each id
appends `_mean` to all data columns
saves into `data/meantidy.csv`

## tidydata.csv
contains 10299 rows and 81 columns in a default csv format.

## meantidy.csv
contains 180 rows and 81 columns in a default csv format.
