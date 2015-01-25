
## Load dplyr package
library(dplyr)

## Load Activity Labels
ylabels<- read.csv("UCI HAR Dataset/activity_labels.txt",  stringsAsFactors=FALSE, header=FALSE, sep=" ", col.names=c("AcitivityID", "AcitivityName"))

## Load Activity IDs
ytest<- read.csv("UCI HAR Dataset/test/y_test.txt", colClasses = "numeric", stringsAsFactors=FALSE, header=FALSE, col.names=c("AcitivityID"))
ytrain<- read.csv("UCI HAR Dataset/train/y_train.txt", colClasses = "numeric", stringsAsFactors=FALSE, header=FALSE, col.names=c("AcitivityID"))

## Combine the test and train activity files
allData<- rbind(ytest, ytrain)

## remove old datasets from memory as we nolonger need those.
rm(ytest)
rm(ytrain)

## Join Activity Labels with ID to get one dataset with both ID and Labels
allData<-left_join(allData, ylabels, by=c("AcitivityID"="AcitivityID"))


## Read test and train subjects file
persondfTest<- read.csv("UCI HAR Dataset/test/subject_test.txt", sep=" ", colClasses = "numeric", col.names=c("personID"), header=FALSE)
persondfTrain<- read.csv("UCI HAR Dataset/train/subject_train.txt", sep=" ", colClasses = "numeric", col.names=c("personID"), header=FALSE)

## Combine datasets using rbind.
persondf<- rbind(persondfTest, persondfTrain)

## remove old datasets from memory as we nolonger need those.
rm(persondfTest)
rm(persondfTrain)

## Combine all datasets on columns using cbind
allData<-cbind(allData, persondf)

## Read Feature labels file
featurelabels<- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE, colClasses = c("numeric", "character"), strip.white=TRUE, stringsAsFactors=FALSE, col.names=c("ID", "FeatureName"))

## Generate sequence for reading fixed width files.
### fieldwidths<-seq(16,16,length.out=561)

## Read Features Data from X_test and X_Train files
featureDataTest<- read.fwf("UCI HAR Dataset/test/X_test.txt", widths=seq(16,16,length.out=561), colClasses = "numeric", header=FALSE, buffersize=500, col.names=featurelabels$FeatureName)
featureDataTrain<- read.fwf("UCI HAR Dataset/train/X_train.txt", widths=seq(16,16,length.out=561), colClasses = "numeric", header=FALSE, buffersize=500, col.names=featurelabels$FeatureName)

## rbind the above datasets to merge them.
featureData<-rbind(featureDataTest, featureDataTrain)

## Column bind feature dataset to the allData dataframe to get Subject, Activity and 561 variable vector into one dataset.
allData<-cbind(allData, featureData)

## remove old datasets from memory as we nolonger need those.
rm(featureDataTest)
rm(featureDataTrain)
rm(featureData)

## Using dplyr package to convert allData to tbl_df.
allData<-tbl_df(allData)

## Dataset for Step 4
## Using select to isolate columns with mean and Standard Deviation, assuming we are looking for mean() only so removing meanFreq() .
filteredData<-select(allData, 2:3, contains("mean"), contains("std"), -contains("meanFreq"))

## Dataset for Step 5 written to file : summaryData.txt
## Chaining using dplyr operator %>%
filteredData %>% group_by(AcitivityName, personID) %>% 
    summarise_each(funs(mean)) %>%
        write.table(row.name=FALSE, file="summaryData.txt")


### If the chainig doesnt work then we can use the below code to output the required file.
##
## groupedData<-group_by(filteredData ,AcitivityName, personID)
## summaryData<-summarise_each(groupedData, funs(mean))
## write.table(summaryData, row.name=FALSE, file="summaryData.txt")
##
###

### End