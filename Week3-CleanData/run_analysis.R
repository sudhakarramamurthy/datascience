#
#Please ensure you have the data file in the current folder from where you are running the R script
#
run_analysis <-function(){
#reading files
X_test <- read.table("UCIHARDataset/test/X_test.txt", header=F, sep="")
Y_test <- read.table("UCIHARDataset/test/Y_test.txt", header=F, sep="")
X_train<- read.table("UCIHARDataset/train/X_train.txt", header=F, sep="")
Y_train <- read.table("UCIHARDataset/train/Y_train.txt", header=F, sep="")
subject_test <- read.table("UCIHARDataset/test/subject_test.txt" , header=F , sep="")
subject_train <- read.table("UCIHARDataset/train/subject_train.txt", header=F, sep="")
features <- t(read.table("UCIHARDataset/features.txt", header=F)) # Load Features in data frame
activity <- read.table("UCIHARDataset/activity_labels.txt", header=F, sep="")

#Column bind Y_subject_test - A
Y_subject_test <- cbind (Y_test , subject_test)
names(Y_subject_test) = c("Activity" , "Subject")

#Column bind Y_subject_train - B
Y_subject_train <- cbind (Y_train , subject_train)
names(Y_subject_train) = c("Activity" , "Subject")

#Merge A & B - C
Y_subject_test_train <- rbind(Y_subject_test , Y_subject_train)

# Merge X_test and X_Train & set heading- D
X_test_train <- rbind(X_test , X_train)
label <- features[2,] #Extract heading as a Vector
names(X_test_train) <- label # set heading

#Extract only mean and Std columns - E
X_test_train_mean <- X_test_train[ , grep ('mean[[:punct:]]', names(X_test_train))]
X_test_train_std <- X_test_train[ , grep ('std[[:punct:]]', names(X_test_train))]
X_test_train_mean_std <- cbind (X_test_train_mean , X_test_train_std)

# Combine C & E
X_test_train_mean_std_Y_subject_test_train <- cbind(X_test_train_mean_std , Y_subject_test_train)

# Take mean of observations per activity per subject
resultset <- aggregate (X_test_train_mean_std_Y_subject_test_train , by = list (X_test_train_mean_std_Y_subject_test_train$Activity, X_test_train_mean_std_Y_subject_test_train$Subject), FUN=mean)

#use factor to fill the Activity Description
resultset$Group.1 <- NULL
resultset$Group.2 <- NULL
resultset$Activity <- factor (resultset$Activity , labels=activity[,2])

#Writeresult to csv file
write.csv(resultset, file = "resultset.csv")

#Write Result set to txt file
write.table(resultset, file = "resultset.txt", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

}



