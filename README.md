===================================
Getting and Cleaning Data - Project
===================================

Data to be arranged like so :
SubjectID, Activity_Label, 561 features vector

Data to be retrieved from these sources : 
PersonID - subject_test.txt 
Activity_Label - activity_lables.txt 
Activity_ID - y_test.txt
561 features vector - x_test.txt, 


Process :
PersonID <- read subject_test.txt
ActivityNm <- read activity_lables.txt 
Activity_ID - read y_test.txt
featureds <- read x_test.txt
remove unwanted/NULL value columns from featureds
apply colnames to featureds from features.txt

mydf<- cbind(PersonID, Activity_ID, windowds, featureds)
