run_analysis <-function(){
  #We read the features names
  featNames<-read.table("features.txt")
#We will begin with the test data
  

  #We read the data that contains the 561 column features and 2947 records
  X_test<-read.table("test/X_test.txt")
  #We read the data that contains the 6 different  activities
  Y_test<-read.table("test/y_test.txt")
  #We read the data that contains the identifier for each volunteer
  subjectestX<-read.table("test/subject_test.txt")
  #We search the features that contains the word mean or std (to achieve the goal of having features related to mean and standard deviation)
  featsToUse<-featNames[grep("mean\\(|std\\(",featNames[,2]),]
  #We keep only the desired features in Xmod
  Xmodtest<-X_test[,featsToUse[,1]]
  #We join the subject id, the ativity label and the 561 feaure vector in Xmodtest
  Xmodtest<-cbind(subjectestX,Y_test,Xmodtest)
  #We name each column with descriptive names
  colnames(Xmodtest)[1]<-"subject"
  colnames(Xmodtest)[2]<-"activityLabel"
  colnames(Xmodtest)[3:dim(Xmodtest)[2]]<-as.character(featsToUse[,2])
  
#We repeat the proccess above for the training data
  
  #We read the data that contains the 561 column features and 2947 records
  X_train<-read.table("train/X_train.txt")
  #We read the data that contains the 6 different  activities
  Y_train<-read.table("train/y_train.txt")
  #We read the data that contains the identifier for each volunteer
  subjectrainX<-read.table("train/subject_train.txt")
  #We keep only the desired features in Xmod
  Xmodtrain<-X_train[,featsToUse[,1]]
  #We join the subject id, the ativity label and the 561 feaure vector in Xmodtrain
  Xmodtrain<-cbind(subjectrainX,Y_train,Xmodtrain)
  #We name each column with descriptive names
  colnames(Xmodtrain)[1]<-"subject"
  colnames(Xmodtrain)[2]<-"activityLabel"
  colnames(Xmodtrain)[3:dim(Xmodtrain)[2]]<-as.character(featsToUse[,2])
  
#We eliminate any incomplete row from both data frames
  Xmodtest<-Xmodtest[complete.cases(Xmodtest),]
  Xmodtrain<-Xmodtrain[complete.cases(Xmodtrain),]
#We merge and order throught the subject column both data frame into Xmerge
  Xmerge<-rbind(Xmodtest,Xmodtrain)
  Xmerge<-Xmerge[order(as.numeric(as.character(Xmerge[,1]))),]
#We use 2 for loops in order to get the mean of all the variables for each combinations for each activity and each subject
  for(i in 1:30){
    for(j in 1:6){
      if(i==1 && j == 1){
        result<-colMeans(Xmerge[Xmerge$subject==i & Xmerge$activityLabel==j,])
      }
      else{
        result<-rbind(result,colMeans(Xmerge[Xmerge$subject==i & Xmerge$activityLabel==j,]))
      }
      
    }
  }
  result
}