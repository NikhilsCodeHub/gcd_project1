ylabels<- read.csv("UCI HAR Dataset/activity_labels.txt",  stringsAsFactors=FALSE, header=FALSE, sep=" ", col.names=c("ID", "Name"))
ytest<- read.csv("UCI HAR Dataset/test/y_test.txt", colClasses = "numeric", stringsAsFactors=FALSE, header=FALSE, col.names=c("ID"))
ytest<-left_join(ytest, ylabels, by=c("ID"="ID"))
