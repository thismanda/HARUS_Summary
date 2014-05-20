
# Retrive and merge the raw data
features = read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)

activities = read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)

subjects.test = read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, stringsAsFactors=FALSE)
subjects.train = read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, stringsAsFactors=FALSE)
data.subjects.merge = rbind(subjects.train, subjects.test)
colnames(data.subjects.merge) = "subject"

data.train = read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, stringsAsFactors=FALSE)
data.test = read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, stringsAsFactors=FALSE)
data.merge = rbind(data.train, data.test)

y.train = read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, stringsAsFactors=FALSE)
y.test = read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, stringsAsFactors=FALSE)
y.merge = rbind(y.train, y.test)

# Descriptive activity name

y.merge$activity = sapply(y.merge, function(x){ activities[x,2] })

# Select variables for mean and expand the labels

data.merge.mean.labels = grep("-mean[(][)]",features[,2],value=TRUE)
data.merge.mean.index = grep("-mean[(][)]",features[,2])
data.merge.mean.subset = data.merge[,data.merge.mean.index]

data.merge.mean.labels = gsub("[(][)]","",data.merge.mean.labels)
data.merge.mean.labels = gsub("-"," ",data.merge.mean.labels)
data.merge.mean.labels = gsub("([[:alpha:]])([[:upper:]])","\\1 \\2",data.merge.mean.labels)
data.merge.mean.labels = gsub("Acc", "Accelerometer",data.merge.mean.labels)
data.merge.mean.labels = gsub("Gyro", "Gyroscope",data.merge.mean.labels)
data.merge.mean.labels = gsub("Mag", "Magnitude",data.merge.mean.labels)
data.merge.mean.labels = gsub("t ", "Time ",data.merge.mean.labels)
data.merge.mean.labels = gsub("f ", "Frequency ",data.merge.mean.labels)
data.merge.mean.labels = sapply(data.merge.mean.labels, 
                                function(x) {
                                  w=unique(unlist(strsplit(x," ")))
                                  paste(unlist(sapply(w, 
                                                      function (y) paste0(toupper(substring(y, 1, 1)), substring(y, 2, nchar(y))))),
                                        collapse="")
                                },
                                USE.NAMES = FALSE)

colnames(data.merge.mean.subset) = data.merge.mean.labels


# Select variables for standard deviations and expand the labels

data.merge.std.labels = grep("-std[(][)]",features[,2],value=TRUE)
data.merge.std.index = grep("-std[(][)]",features[,2])
data.merge.std.subset = data.merge[,data.merge.std.index]

data.merge.std.labels = gsub("[(][)]","",data.merge.std.labels)
data.merge.std.labels = gsub("-"," ",data.merge.std.labels)
data.merge.std.labels = gsub("([[:alpha:]])([[:upper:]])","\\1 \\2",data.merge.std.labels)
data.merge.std.labels = gsub("Acc", "Accelerometer",data.merge.std.labels)
data.merge.std.labels = gsub("Gyro", "Gyroscope",data.merge.std.labels)
data.merge.std.labels = gsub("Mag", "Magnitude",data.merge.std.labels)
data.merge.std.labels = gsub("t ", "Time ",data.merge.std.labels)
data.merge.std.labels = gsub("f ", "Frequency ",data.merge.std.labels)
data.merge.std.labels = gsub("std", "Standard Deviation",data.merge.std.labels)
data.merge.std.labels = sapply(data.merge.std.labels, 
                               function(x) {
                                 w=unique(unlist(strsplit(x," ")))
                                 paste(unlist(sapply(w, 
                                                     function (y) paste0(toupper(substring(y, 1, 1)), substring(y, 2, nchar(y))))),
                                       collapse="")
                               },
                               USE.NAMES = FALSE)

colnames(data.merge.std.subset) = data.merge.std.labels

# Merge and summarize the tiday data

data.final = cbind(data.subjects.merge, y.merge$activity, data.merge.mean.subset, data.merge.std.subset)

colnames(data.final)[2]="activity"

subject.mean = aggregate(data.final[,3:ncol(data.final)], 
                         by=list(subject=data.final$subject, 
                                 activity=data.final$activity), 
                         FUN=mean)


subject.mean = subject.mean[order(subject.mean$subject, subject.mean$activity),]

# Write the tidy data in a text file
write.table(subject.mean, "./tidy_data.txt", sep="\t")

