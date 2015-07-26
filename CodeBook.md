run_analysis.R has three functions:

  runAnalysis - the main function which joins train and test data sets and 
  returns tidy set with mean values over all meaningfull variables per subject and activity.
  parameters:
    dataFolder - data sets folder name, it should be located in the same directory as run_analysis.R
  return value:
    tidySet - data set with the average of each variable for each activity and each subject
        
  loadFormattedSet - loads test or train data set from files into memory 
  and performs a set of transformations on the set:
  * rename columns
  * selects only meaningfull variable
  * adds activity name
  * adds subject id
  parameters:
    isTest - indicates if operations to be performed on train or test data
    dataFolder - data sets folder name
  return value:
    test or train data set with only meaningfull columns
  
  getFileName - gets file name depending of data set type: train or test
  parameters:
    fileNamePart - X, Y or subject
    isTest - indicates if operation to be performed on train or test data
    dataFolder - data sets folder name
  return values:
    full file name
    
To perform trasformation execute:
        tidySet <- runAnalysis("<DATA_SET_FOLDER>")
        
        <DATA_SET_FOLDER> - should be located in the same directory as run_analysis.R
