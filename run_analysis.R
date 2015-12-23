library(dplyr)
library(tidyr)
library(data.table)

#read "test" and "train" observations/feature measurements from file
testObs <- read.table("./test/X_test.txt")
trainObs <- read.table("./train/X_train.txt")

#read "test" and "train" activity identifiers from file
testAct <- read.table("./test/y_test.txt")
trainAct <- read.table("./train/y_train.txt")

#read "test" and "train" subjects from file
testSub <- read.table("./test/subject_test.txt")
trainSub <- read.table("./train/subject_train.txt")

#read "features" and "activity labels" subjects from file
features <- read.table("features.txt")
actLabels <- read.table("activity_labels.txt")

# Step 1 - Prepare combined data set (training and testing)
combinedObs <- rbind(testObs, trainObs)
combinedAct <- rbind(testAct, trainAct)
combinedSub <- rbind(testSub, trainSub)

# Step 2 - Prepare subset of the original combined raw data set
# This subset will include only those measurement variables which contain 
# either mean or standard deviation (std) in their names
varIndex <- c(grep("std()", features$V2, fixed = TRUE),grep("mean()", features$V2, fixed = TRUE))
combinedObs <- combinedObs[,sort(varIndex)]
#######combinedObs <- combinedObs[,1:6]

# Step 3 Replace the numeric codes for activity with the corresponding alphabetic value
combinedAct <- left_join(combinedAct, actLabels, by="V1")

# Step 4 Modify the original variable names (column names)
colnames(combinedObs) <- features[sort(varIndex),2]
#######colnames(combinedObs) <- features[1:6,2]

# Step 5 Prepare separate tidy data set containing observations consisting of 
# study participants, activities, and a computed average for each of the measurement variables.
combinedObs$Subject = combinedSub$V1
combinedObs$Activity = combinedAct$V2

combObsTidy <- combinedObs %>%
                  gather(key=feature, value=measurement, -Subject, -Activity) %>%
                  group_by(Subject, Activity, feature) %>%
                  summarise(Average=mean(measurement))


write.table(combObsTidy, "./tidy_data_set.txt", row.names = FALSE)




