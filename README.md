===================================
Getting and Cleaning Data - Project
===================================

The data gathered from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The dataset provided contains the following structure :
UCI HAR Dataset                              
   |--activity_labels.txt                              
   |--features.txt                              
   |--features_info.txt                              
   |--README.txt                              
   |--test                              
       |--Inertial Signals                              
               |------body_acc_x_test.txt                              
               |------body_acc_y_test.txt                              
               |------body_acc_z_test.txt                              
               |------body_gyro_x_test.txt                              
               |------body_gyro_y_test.txt                              
               |------body_gyro_z_test.txt                              
               |------total_acc_x_test.txt                              
               |------total_acc_y_test.txt                              
               |------total_acc_z_test.txt                              
       |----subject_test.txt                              
       |----X_test.txt                              
       |----y_test.txt                              
   |--train                                     
        |--Inertial Signals                              
               |------body_acc_x_train.txt                              
               |------body_acc_y_train.txt                              
               |------body_acc_z_train.txt                              
               |------body_gyro_x_train.txt                              
               |------body_gyro_y_train.txt                              
               |------body_gyro_z_train.txt                              
               |------total_acc_x_train.txt                              
               |------total_acc_y_train.txt                              
               |------total_acc_z_train.txt                              
       |----subject_train.txt                              
       |----X_train.txt                              
       |----y_train.txt                              



For the purpose of our exersice we are going to use the subset of the data as shown below:

UCI HAR Dataset                              
   |--activity_labels.txt                              
   |--features.txt                              
   |--features_info.txt                              
   |--README.txt                              
   |--test                              
       |----subject_test.txt                              
       |----X_test.txt                              
       |----y_test.txt                              
   |--train                                     
       |----subject_train.txt                              
       |----X_train.txt                              
       |----y_train.txt                                                   

       
The description of each file used in the analysis is as given below:
===================================================================

- 'README.md'

- 'CodeBook.md': Describes the variables in the dataset and the analysis performed to merge the test and train data into single dataset.

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

