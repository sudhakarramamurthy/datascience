1. Read files X_test,X_train.Y_test,Y_train,subject_test,subject_train,features and activity_lables text files into dataframes. 
2. Column bind Dataframes Y_test and subject_test and add column names Activity and Subject to it. Loaded on to variable Y_subject_test -> A
3. Column bind Dataframes Y_train and subject_train and add column names Activity and Subject to it. Loaded into variable Y_subject_train->B
4. Merge A and B (dim-10299*2). Loaded in to variable Y_subject_test_train ->C
5. Merge X_train and X_test data. Loaded in to variable X_test_train -> D (dim-10299*561)
6. Change column names of D from features.txt. Updated X_test_train
7. Eliminate columns from D which do not have "mean()" or "std()" in the column names. ->E (dim-10299*66). 
8. Column bind C and E (dim-10299*68). Done by cbind of using X_test_train_mean , X_test_train_std 
9. Take mean of observations per activity per subject. (dim-180*68). Done using aggregate()
10. Replace activity numbers with Activity names from activity_lables.txt. Done on the result set using factor()
11. used write.csv to get a text file from the above Data Frame.Submit this text file for Question 1 of Assessment. Created a CSV file.
12. Upload "run_analysis.R", "code book" and "read me" files to Github and Share the link for Question 2 of Assessment
