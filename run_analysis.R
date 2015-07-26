# main fumction which created tidy set
runAnalysis <- function(dataFolder = "UCI HAR Dataset") {
        # load common feature names and activity lables
        commonFeatures <- read.table(paste("./", dataFolder, "/features.txt", sep = ""))
        commonActivities <- read.table(paste("./", dataFolder, "/activity_labels.txt", sep = ""))
        
        testSet <- loadFormattedSet(TRUE, dataFolder)
        trainSet <- loadFormattedSet(FALSE, dataFolder)
        
        # merged data set with descriptive column names
        mergedSet <- rbind(testSet, trainSet)
        
        # create tidy data set with average of each variable for each activity and each subject
        tidySet <- mergedSet %>% group_by(subject, activity) %>% summarise_each(funs(mean))
        
        tidySet
}

# function to load raw data from files, enrich it with activity names and 
# subject id, and set proper column names
loadFormattedSet <- function (isTest = TRUE, dataFolder = "UCI HAR Dataset") {
        
        # load raw data and set descriptive column names
        rawData <- read.table(getFileName("X", isTest))
        colnames(rawData) <- commonFeatures[,2]
        # get only mean and std
        rawData <- rawData[,grepl("*-mean\\(\\)*|*-std\\(\\)*", colnames(rawData))]
        
        # add subject to raw data
        subjects <- read.table(getFileName("subject", isTest, dataFolder))
        rawData$subject <- as.integer(subjects$V1)
        
        # add activity name to raw data
        activities <- read.table(getFileName("Y", isTest, dataFolder))
        tmpActivities <- merge(activities, commonActivities)
        rawData$activity <- as.character(tmpActivities$V2)
        
        rawData
}

# get full file name depending on dataset type
getFileName <- function(fileNamePart, isTest, dataFolder = "UCI HAR Dataset") {
        if (isTest) {
                paste("./", dataFolder, "/test/", fileNamePart, "_test.txt", 
                      sep = "")
        } else {
                paste("./", dataFolder, "/train/", fileNamePart, "_train.txt", 
                      sep = "")
        }
}

tidySet <- runAnalysis("UCI HAR Dataset")
write.table(tidySet, file = "tidySet.txt", row.names = FALSE)

