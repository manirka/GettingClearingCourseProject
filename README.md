The main script is run_analysis.R. This script has function runAnalysis which 
join two data sets (the default folder for data set files is "UCI HAR Dataset"),
cleans merged data up and produce data set with mean values of meaningful 
variables for each subject and activity.

To perform trasformation execute:
<pre>
        tidySet <- runAnalysis("DATA_SET_FOLDER")
        
        DATA_SET_FOLDER - should be located in the same directory as run_analysis.R
</pre>
