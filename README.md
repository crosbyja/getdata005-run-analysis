Readme for Getdata-005 Course Project
=======================
###Summary:
Experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data. 

###Input files:
x_train.txt: train data set
y_train.txt: train data labels
subject_train.txt: subject id for each measurement in the train data set
x_test.txt: test data set
y_test.txt: test data labales
subject_test.txt: subject id for each measurement in the test data set
actvity_labels.txt: a file containing numerical id value for each activity description
features.txt: a file containing all measured variable names

The following working data sets are generated:
traincomplete: column bound data frame of data from training data set
testcomplete: column bound data frame of data from testing data set
featurelabels: data set for measured variable column names
activityids: a lookup table that contains activity id and description
master: row bound data frame of traincomplete and testcomplete data frames
mastermerge: merged data frame to add activity description rather than activity id
newdata: data frame result of averages of each variable by subjectid and activity 
description

###Output:
A tidy data set is generated that includes only measured variables of mean and standard
deviation. The data is summarized by generating the averages for variable by subjectid and 
activity description. The output 'tidydata.txt' is generated in the working directory.


###Application workflow:
1. Files x_train.txt, y_train.txt, and subject_train.txt are imported and column bound 
together to create "traincomplete" data frame
2. Files x_test.txt, y_test.txt, and subject_test.txt are imported and column bound 
together to create "testcomplete" data frame
3. Feature labels are imported as "featurelabels" from features.txt, for use later.
4. Activity descriptions are imported as "activityids" from activity_labels.txt. Column
names on the "activityids" are updated accordingly.
5. All rows between "traincomplete" and "testcomplete" data frame are bound into "master".
6. Columns names in "master" are updated using "featurelabels"
7. Only column names that include mean and standard deviation are extracted from "master"
8. Activity ids in "master" are looked up to populate with descriptions from "activityids".
This merge operation performs a left join to include all records from "master". The end
result is a data frame called "mastermerge"
9. Activityid is removed since descriptions have been added, and Columns are reordered 
for readability .
10. Variable columns names in "mastermerge" are cleaned. Illegal characters and duplicate
names are fixed.
11. A new data set "newdata" is generated with the averages for each variable by subjectid
and activitydescription.
12. A new file tidydata.txt is written out to working directory to include all records 
in "newdata".