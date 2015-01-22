
## Load Activity Labels
ylabels<- read.csv("UCI HAR Dataset/activity_labels.txt",  stringsAsFactors=FALSE, header=FALSE, sep=" ", col.names=c("ID", "Name"))

## Load Activity IDs
ytest<- read.csv("UCI HAR Dataset/test/y_test.txt", colClasses = "numeric", stringsAsFactors=FALSE, header=FALSE, col.names=c("ID"))

## Join Activity Labels with ID to get one dataset with both ID and Labels
allData<-left_join(ytest, ylabels, by=c("ID"="ID"))
rm(ytest)

## Read test subjects file
persondf<- read.csv("UCI HAR Dataset/test/subject_test.txt", sep=" ", colClasses = "numeric", col.names=c("personID"), header=FALSE)

## Combine all datasets on columns using cbind
allData<-cbind(allData, persondf)

## Read Feature labels file
featurelabels<- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE, colClasses = c("numeric", "character"), strip.white=TRUE, stringsAsFactors=FALSE, col.names=c("ID", "FeatureName"))

## Generate sequence for reading fixed width files.
##fieldwidths<-seq(16,16,length.out=561)

## Read Feature Data from X_test file
featureDataTest<- read.fwf("UCI HAR Dataset/test/X_test.txt", widths=seq(16,16,length.out=561), colClasses = "numeric", header=FALSE, buffersize=100, col.names=featurelabels$FeatureName)


xtest<-cbind(allData, featureDataTest)

xtest<-tbl_df(xtest)


rm(featureDataTest)

## Read Feature Data from X_train file
##featureDataTrain<- read.fwf("UCI HAR Dataset/test/X_train.txt", widths=seq(16,16,length.out=561), colClasses = "numeric", header=FALSE, buffersize=100, col.names=featurelabels$FeatureName)
