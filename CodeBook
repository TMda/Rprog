## CODE BOOK


The Tiny Dataset assignmnet

The tiny dataset was produced from an orginal dataset that was measuring physical paramaters such as velocity and acceleration from samsung cellphones belonging to subject performing differents tasks such as walking, laying,etc.   

The dataset was split into 6 files:
The Xtrain.txt, Xtest.txt, Ytrain.txt, Ytest.txt, features.txt and activity.txt.

The goal of this assignmnent is to merge these 6 files into a unified dataset, to modify the dataset so that columns names and the activity column are in descriptive form and not filled with codes.

The result of these manipulation is called the tidy dataset.

Steps followed to produce the tidy dataset:

1) Merging the 6 files into a unified dataset.
  1.1.) Merging the file Xtrain, Xtest, Ytran and Ytest into a single dataset. In the 
      R script this is done using the data.frame() command;
  1.2.) Using the file features.txt for mapping the encoded columns names into its original human readible name.
      The result of this operation is to have a dataset with column name in humane understanble form instead of the 
      V1, V2,...Vn format;
  1.3.) Using the file activity.txt for mapping the activity code to its humanne readible format.
      The result of this operation is to have a dataset with the column activity contains an explication like "walking"
      "standing", etc instead of the code associated to the activity.
      
  
At the end of the step one, we have one dataset with column in a descriptive format and with the column activity 
containing a description of the activity.

2) Creating a dataset that contains only the mean and the standard deviation of each of the dataset measure.
  Each line of our dataset contains measures related to different physical parameters of the activity performed by the phone of the subject holding the phone.
  
  Each line contains special measure related to the mean and the std deviations of the parameters measured. It is these columns that we are going to retrieve for each row of our dataset.
  
  2.1) Removing the names of all the columns containing mean and standard deviation measures, in the R script this action is performed using the grepl command.
  2.2) Retrieving all the rows of these columns and storingg them into a new datastet called tidy_dataset.
  2.3) The step 2.1 has not been completed as there are still 6 columns included in the tidy_dataset that are not
  related to mean but to mean frequencies. Step 2.3 removes these 6 columns from the tidy_dataset.
  2.4) Printing into a csv file the tidy_dataset for further processing.
  
  
