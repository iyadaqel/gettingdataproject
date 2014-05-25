#Reading the column names of the dataframe
features <- read.table('UCI HAR Dataset/features.txt');
features <- features[,'V2'];

#Reading the txt files into tables and then converting them to dataframes
subject_test_table <- read.table('UCI HAR Dataset/test/subject_test.txt', sep="\t", col.names=c('subject'),fill=FALSE, strip.white=TRUE);
x_test_table <- read.table('UCI HAR Dataset/test/X_test.txt', col.names=features);
y_test_table <- read.table('UCI HAR Dataset/test/y_test.txt', sep="\t", col.names=c('activity'),fill=FALSE, strip.white=TRUE);
subject_test_dataframe <- as.data.frame.matrix(subject_test_table);
x_test_dataframe <- as.data.frame.matrix(x_test_table);
y_test_dataframe <- as.data.frame.matrix(y_test_table);

#bing the 3 files to create the first dataset.
firstdataframe <- cbind(subject_test_dataframe,y_test_dataframe,x_test_dataframe)

#Reading the txt files into tables and then converting them to dataframes
subject_train_table <- read.table('UCI HAR Dataset/train/subject_train.txt', sep="\t", col.names=c('subject'),fill=FALSE, strip.white=TRUE);
x_train_table <- read.table('UCI HAR Dataset/train/X_train.txt', col.names=features);
y_train_table <- read.table('UCI HAR Dataset/train/y_train.txt', sep="\t", col.names=c('activity'),fill=FALSE, strip.white=TRUE);
subject_train_dataframe <- as.data.frame.matrix(subject_train_table);
x_train_dataframe <- as.data.frame.matrix(x_train_table);
y_train_dataframe <- as.data.frame.matrix(y_train_table);

#binding the 3 files into tables and then converting them to dataframes.
seconddataframe <- cbind(subject_train_dataframe,y_train_dataframe,x_train_dataframe);

#merging the two frames together.
combineddataframe <- rbind(firstdataframe , seconddataframe);

#reading the activiy labels and then merging it with the datasets.
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt');
finaldataset <- merge(activity_labels, combineddataframe , by.x ='V1' , by.y ='activity');

#Extracting only means and Std columns and renaming some columns
meansAndStds <- 3 + c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:428,503:504,516:517,529:530,542:543)
finaldataset <- finaldataset[,c(1:3,meansAndStds)];
colnames(finaldataset)[1:2] <- c('Activity_number', 'Activity') ;