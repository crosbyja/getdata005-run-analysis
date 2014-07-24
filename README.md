Course Project for getdata-005
=======================
All variable references below are surrounded in quotes (")

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
11. Data is ordered by subjectid, then activitydescription in "mastermerge" for 
readability.
12. A new data set "newdata" is generated with the averages for each variable by subjectid and 
activitydescription.
13. Data is ordered in "newdata" by subjectid then activitydescription for readability.
14. A new file tidydata.txt is written out to working directory to include all records 
in "newdata".
