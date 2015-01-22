
## Load Activity Labels
ylabels<- read.csv("UCI HAR Dataset/activity_labels.txt",  stringsAsFactors=FALSE, header=FALSE, sep=" ", col.names=c("AcitivityID", "AcitivityName"))

## Load Activity IDs
ytest<- read.csv("UCI HAR Dataset/test/y_test.txt", colClasses = "numeric", stringsAsFactors=FALSE, header=FALSE, col.names=c("AcitivityID"))
ytrain<- read.csv("UCI HAR Dataset/train/y_train.txt", colClasses = "numeric", stringsAsFactors=FALSE, header=FALSE, col.names=c("AcitivityID"))

allData<- rbind(ytest, ytrain)

rm(ytest)
rm(ytrain)

## Join Activity Labels with ID to get one dataset with both ID and Labels
allData<-left_join(allData, ylabels, by=c("AcitivityID"="AcitivityID"))


## Read test subjects file
persondfTest<- read.csv("UCI HAR Dataset/test/subject_test.txt", sep=" ", colClasses = "numeric", col.names=c("personID"), header=FALSE)
persondfTrain<- read.csv("UCI HAR Dataset/train/subject_train.txt", sep=" ", colClasses = "numeric", col.names=c("personID"), header=FALSE)

persondf<- rbind(persondfTest, persondfTrain)

rm(persondfTest)
rm(persondfTrain)

## Combine all datasets on columns using cbind
allData<-cbind(allData, persondf)

## Read Feature labels file
featurelabels<- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE, colClasses = c("numeric", "character"), strip.white=TRUE, stringsAsFactors=FALSE, col.names=c("ID", "FeatureName"))

## Generate sequence for reading fixed width files.
##fieldwidths<-seq(16,16,length.out=561)

## Read Feature Data from X_test file
featureDataTest<- read.fwf("UCI HAR Dataset/test/X_test.txt", widths=seq(16,16,length.out=561), colClasses = "numeric", header=FALSE, buffersize=500, col.names=featurelabels$FeatureName)
featureDataTrain<- read.fwf("UCI HAR Dataset/train/X_train.txt", widths=seq(16,16,length.out=561), colClasses = "numeric", header=FALSE, buffersize=500, col.names=featurelabels$FeatureName)

featureData<-rbind(featureDataTest, featureDataTrain)

rm(featureDataTest)
rm(featureDataTrain)

xtest<-cbind(allData, featureData)

rm(featureData)

xtest<-tbl_df(xtest)


## Using select to isolate columns with mean and Standard Deviation, assuming we are looking for mean() only so removing meanFreq() .
filteredData<-select(xtest, 1:3, contains("mean"), contains("std"), -contains("meanFreq"))

groupedData<-group_by(filteredData ,AcitivityName, personID)

summaryData<-summarise_each(groupedData, funs(mean))

#