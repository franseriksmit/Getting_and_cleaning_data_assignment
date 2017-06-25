library(reshape2)
library(dplyr)

## load data get  metadata(colnames)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-"dataset.zip"
if(!file.exists(filename)){download.file(fileurl, filename)}
if(!file.exists("UCI HAR Dataset")){unzip(filename)}
actLabel<-read.table("UCI HAR Dataset/activity_labels.txt")
actLabelv<-as.character(actLabel[,2])
features<-read.table("UCI HAR Dataset/features.txt")
featuresv<-as.character(features[,2])
Columnswanted<-grep(".*mean.*|.*std.*",featuresv)
Columnswanted.names<-featuresv[Columnswanted]

##clean columnnames
Columnswanted.names=gsub("-mean", "Mean", Columnswanted.names)
Columnswanted.names=gsub("-std", "std", Columnswanted.names)
Columnswanted.names=gsub("[()-]", "", Columnswanted.names)

## read dataset train
train<-read.table("UCI HAR Dataset/train/X_train.txt")
trainwanted<-select(train, Columnswanted)
trainact<-read.table("UCI HAR Dataset/train/Y_train.txt")
trainsub<-read.table("UCI HAR Dataset/train/subject_train.txt")
train<-cbind(trainsub, trainact, trainwanted)

## read dataset test
test<-read.table("UCI HAR Dataset/test/X_test.txt")
testwanted<-select(test, Columnswanted)
testsub<-read.table("UCI HAR Dataset/test/subject_test.txt")
testact<-read.table("UCI HAR Dataset/test/Y_test.txt") 
test<-cbind(testsub, testact,testwanted)

## merge train and test dataset 
Samen<-rbind(test, train)
## set columnsnames
colnames(Samen)<-c("subject","activity", Columnswanted.names)
##  turn activities and subjects into factors
Samen$activity<-factor(Samen$activity, levels = actLabel[,1], labels = actLabelv)
Samen$subject<-as.factor(Samen$subject)
## melt samen to get mean
Samen.melted<-melt(Samen, id=c("subject", "activity"))
Samen.mean<-dcast(Samen.melted, subject+activity~variable, mean)
## write tidy file
write.table(Samen.mean, "tidy.txt", row.names = FALSE, quote = FALSE)