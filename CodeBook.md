========================
CodeBook.md
========================


The final datset is written to the file called : summaryData.txt

Below are the column names that describe the data :
===================================================
AcitivityName
personID
tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyAccMag.mean..
tGravityAccMag.mean..
tBodyAccJerkMag.mean..
tBodyGyroMag.mean..
tBodyGyroJerkMag.mean..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyAccMag.mean..
fBodyBodyAccJerkMag.mean..
fBodyBodyGyroMag.mean..
fBodyBodyGyroJerkMag.mean..
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.std..
tGravityAccMag.std..
tBodyAccJerkMag.std..
tBodyGyroMag.std..
tBodyGyroJerkMag.std..
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.std..
fBodyBodyAccJerkMag.std..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.std..



The Activity Labels are as follows :
====================================
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

personID - Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Steps and Analysis performed : 
==============================

1.  Load dplyr package
2.  Load Activity Labels in a dataframe
3.  Load Activity IDs from file y_test.txt and y_train.txt
4.  Combine the test and train activity files
5.  remove old datasets from memory as we nolonger need those.
6.  Join Activity Labels with ID to get one dataset with both ID and Labels
7.  Read test and train subjects file. We name the column PersonID.
8.  Combine datasets using rbind.
9.  remove old datasets from memory as we nolonger need those.
10. Combine activity and person datasets using cbind. 
11. Read Feature labels file
12  Generate sequence for reading fixed width files.
13. Read Features Data from X_test and X_Train files
14. rbind the above datasets to merge them. 
15. Column bind feature dataset to the allData dataframe to get Subject, Activity and 561 variable vector into one dataset. This gives us a single merged dataset of all train and test data.
16. remove old datasets from memory as we nolonger need those.

17. Dataset for Step 4. Using select to isolate columns with mean and Standard Deviation, assuming we are looking for mean() only so removing meanFreq() .

18. Dataset for Step 5 written to file : summaryData.txt .Chaining using dplyr operator %>%


