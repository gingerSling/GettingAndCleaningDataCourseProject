VARIABLE DESCRIPTION
featNames: This variable contains the information in features.txt
X_test: This variable contains the information in X_test.txt
Y_test: This variable contains the information in y_test.txt
subjectestX: This variable contains the information in subject_test.txt
featsToUse: This variables keeps the features that are realted to mean or standard deviation extracted from the variable featNames
Xmodtest: This variable is a data frame which first column is the subject id, the second column is the activity label and the rest are the features related to the mean and standard deviation all of these columns are information of test data
X_train: This variable contains the information in X_train.txt
Y_train: This variable contains the information in y_train.txt
subjectrainX: This variable contains the information in subject_train.txt
Xmodtrain: This variable is a data frame which first column is the subject id, the second column is the activity label and the rest are the features related to the mean and standard deviation all of these columns are information of the training data
Xmerge: This variable is a data frame that merge Xmodtest and Xmodain and is ordered throught the subject feature
result: This data frame contains all thje combinations of subject and activity and each combination has the mean for all of the other variables

DATA AND TRANSFORMATION
We read and save the data from feautes.txt and the we search using grep for feautres that contains the word mean or std in order to keep the features that we are interested on and save it in featsToUse
We read and save the data from X_test.txt that contains the 561 vector features, y_test.txt that contains the activity label and subject_test.txt that contains the subject id. Then we eliminate the features in X_test that dont appear inn featsToUse, then we proceed to join the Xmodtest (X_test without the noninterested features) , Y_test and subjectestX. We name each column with the descriptive name using the names of the 561 feature vector and the literals "subject" and "activityLabel".
We repeat the process above but this time for the train data
We check that all the rows of Xmodtest and Xmodtrain are complete. Then we merge the Xmodtest and Xmodtrain into Xmerge using rbind.
We proceed to agroup all the possible combinations of subject and activityLabel and calculate the mean for each combination of all the other variables and store these results in the variable result.
We proceed to change the activities label to a more understanding label.