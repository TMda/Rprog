dirtest="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\test\\X_test.txt";
dirtrain="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\train\\X_train.txt";

ytrain="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\train\\y_train.txt";
ytest="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\test\\y_test.txt";

feat="C:\\Users\\TM\\Google Drive\\Coursera\\JH 3 Getting and Cleaning Data\\assignments\\W2\\peer assignment\\UCI HAR Dataset\\features.txt"

Xtrain=read.table(dirtrain);
Xtest=read.table(dirtest);

Ytrain=read.table(ytrain);
Ytest=read.table(ytest);

Feat=read.table(feat)

col=Feat[,2];
col=t(col);
colnames(Xtrain)=col
colnames(Xtest)=col
x=rbind(Xtrain,Xtest)