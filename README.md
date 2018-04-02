# Whats in this repository
The script its included in the repository and its called run_analysis.R

In the CodeBook.md is a more detailed descrpition of the script.

The goal of the script is to take the data from the UCI HAR Dataset and join the different txt into one unique table and extract the mean of every variable fixing all the combinations of 2 specific variables.

# Script description

We read and save the data from feautes.txt and the we search using grep for feautres that contains the word mean or std in order to keep the features that we are interested on and save it in featsToUse

We read and save the data from X_test.txt that contains the 561 vector features, y_test.txt that contains the activity label and subject_test.txt that contains the subject id. Then we eliminate the features in X_test that dont appear inn featsToUse, then we proceed to join the Xmodtest (X_test without the noninterested features) , Y_test and subjectestX. We name each column with the descriptive name using the names of the 561 feature vector and the literals "subject" and "activityLabel".

We repeat the process above but this time for the train data

We check that all the rows of Xmodtest and Xmodtrain are complete. Then we merge the Xmodtest and Xmodtrain into Xmerge using rbind.

We proceed to agroup all the possible combinations of subject and activityLabel and calculate the mean for each combination of all the other variables and store these results in the variable result.

We proceed to change the activities label to a more understanding label.
