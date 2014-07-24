##Import training tables and bind columns into traincomplete data frame
xtrain <- read.table(file = "X_train.txt", header = FALSE,sep = "")
ytrainlb <- read.table(file = "y_train.txt", header = FALSE,sep = "")
subtrain <- read.table(file = "subject_train.txt", header = FALSE,sep = "")
traincomplete <- data.frame(cbind(subtrain,ytrainlb,xtrain))

##Import testing tables and bind columns into testcomplete data frame
xtest <- read.table(file = "X_test.txt", header = FALSE,sep = "")
ytestlb <- read.table(file = "y_test.txt", header = FALSE,sep = "")
subtest <- read.table(file = "subject_test.txt", header = FALSE,sep = "")
testcomplete <- data.frame(cbind(subtest,ytestlb,xtest))

##Import feature labels to be used for columns labels later
featurelabels <- read.table(file = "features.txt", header = FALSE, sep = "")

##Import activity descriptions to replaced id in column later
activityids <- read.table(file = "activity_labels.txt", header = FALSE, sep = "")
colnames(activityids) <- c("activity", "activitydescription")

##Bind all rows for combined data frame
master <- rbind(traincomplete, testcomplete)
  
##Label column names and paste feature column labels
colnames(master) <- c("subjectid","activity")
colnames(master)[3:563] <- paste(featurelabels$V2)

#Extract only mean and std columns
master <- master[,c(1:2,grep("-mean\\(\\)|-std\\(\\)",colnames(master)))]

#Merge activty description based on activity id column -- using left outer join to include all records from master
mastermerge <- merge(x = master, y = activityids, by = "activity", all.x = TRUE)

#Reorder columns for readability and remove activitiyid (since it is a lookup value)
mastermerge <- mastermerge[,c(2,69,3:68)]

#fix variable column names - remove parens and duplicate "body" in label
colnames(mastermerge) <- gsub("BodyBody","Body",colnames(mastermerge), fixed = TRUE)
colnames(mastermerge) <- gsub("()","",colnames(mastermerge), fixed = TRUE)
colnames(mastermerge)

#order by subject then activity for viewability
mastermerge <- mastermerge[order(mastermerge$subjectid, mastermerge$activitydescription),]

#create new data set to include variable average for each change in subject and activitydescription
write.table(newdata, "tidydata.txt", sep=",")
