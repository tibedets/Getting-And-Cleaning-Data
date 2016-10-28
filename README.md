# Getting-And-Cleaning-Data
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy dataset
as described below, 2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed 
to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for 
example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
advanced algorithms to attract new users. The data linked to from the course website represent data 
collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available 
at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### Getting and Cleaning Data Project

Thaddeus Brown

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

##### Overview
This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent
analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##### Project Summary
run_analysis.R

This will check to see if the package *plyr* required is available and if not will download it as well as the required data from 
*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip* and 
store it in a zip file called data.zip. After this a data folder will be generated containing the two datasets.

The data is located in the data folder  
data/tidydata.csv
data/meantidy.csv

##### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.
