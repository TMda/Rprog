
###Directory where the dataset are located

dirtest=".//test//X_test.txt";
dirtrain=".//train//X_train.txt";

ytrain=".//train//y_train.txt";
ytest=".//test//y_test.txt";

subjecttrain=".//subject_train.txt"
subjecttest=".//test//subject_test.txt"

feat=".//features.txt"


#Loading of the dataset into dataframes

Xtrain=read.table(dirtrain);
Xtest=read.table(dirtest);

Ytrain=read.table(ytrain);
Ytest=read.table(ytest);

subjtrain=read.table(subjecttrain);
subjtest=read.table(subjecttest);

Feat=read.table(feat);

## Merging the subject and Xtrain dataframe by column into work 1,2 dataframe
w1=data.frame(subjtrain,Ytrain,Xtrain)
w2=data.frame(subjtest,Ytest,Xtest)

## Merging train (w1) and tets dataset (w2) into a work dataframe w
w=rbind(w1,w2)


## Loading the column header into a vector
colu=Feat[,2];

## changing the columns header into the Work Dataframe
v=c("subject","activity"); ## adding the 2 column subject and activity
c=as.character(colu); ## coercing the vector colu into a character vector
f=c(v,c); ## creating the final column name vector f

names(w)<- t(f) ## assigning the columns names of dataframe w to vctor f

### changing the activity code by the activity name
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING

w$activity[w$activity==1]="WALKING";
w$activity[w$activity==2]="WALKING UPSTAIRS";
w$activity[w$activity==3]="WALKING";
w$activity[w$activity==4]="SITTING";
w$activity[w$activity==5]="STANDING";
w$activity[w$activity==6]="LAYING";

#list of column to retrieve using a grep - 
colret1=colnames(w)[grepl('-mean()',colnames(w))] ## all columns with mean in their names
colret2=colnames(w)[grepl('-std()',colnames(w))] ## all columns with std in their names

cret=c("subject","activity",colret1,colret2); ## creating the vector with all the columns names we want to retrieve
## subset of the Dataframe with only these columns


##### create the tidy dataset       

wfinal=w[cret];

####### removing mean frequencies

h=c("fBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y"
    ,"fBodyGyro-meanFreq()-Z"         
    ,"fBodyAccMag-mean()"
    ,"fBodyAccMag-meanFreq()"         
    ,"fBodyBodyAccJerkMag-meanFreq()") ; ## Building a vector with the column we want to remove


wfinal=wfinal[,!(names(wfinal) %in% h)]; ## Building the final dataset without the columns to be removed

##### writing the tidy dataset into a csv file

write.csv(wfinal,".//tidy_dataset.csv");
