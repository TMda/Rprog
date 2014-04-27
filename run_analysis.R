
###Directory where the dataset are located

dirtest="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\test\\X_test.txt";
dirtrain="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\train\\X_train.txt";

ytrain="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\train\\y_train.txt";
ytest="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\test\\y_test.txt";

subjecttrain="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\train\\subject_train.txt"
subjecttest="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\test\\subject_test.txt"


feat="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\features.txt"


#Loading of the dataset into dataframes

Xtrain=read.table(dirtrain);
Xtest=read.table(dirtest);

Ytrain=read.table(ytrain);
Ytest=read.table(ytest);

subjtrain=read.table(subjecttrain);
subjtest=read.table(subjecttest);

Feat=read.table(feat);

## Merging the subject and Xtrain dataframe by column into a work 1 dataframe
w1=data.frame(subjtrain,Ytrain,Xtrain)
w2=data.frame(subjtest,Ytest,Xtest)
## Merging train (w1) and tets dataset (w2) into a work directory
w=rbind(w1,w2)


## Loading the column header into a vector
colu=Feat[,2];

## changing the columns header into the Work Dataframe
v=c("subject","activity");
c=as.character(colu);
f=c(v,c);
names(w)<- t(f)
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
colret1=colnames(w)[grepl('-mean()',colnames(w))]
colret2=colnames(w)[grepl('-std()',colnames(w))]

cret=c("subject","activity",colret1,colret2);
## subset of the Dataframe with only these columns

wfinal=w[cret];

