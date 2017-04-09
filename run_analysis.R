#----------------------------------------------------------------------------------------------
# Filename:     run_analysis.R
# Author:       Geoff Skellams
# 
# File Summary: This program implements the code for the Getting & Cleaning Data assignment.
#               It reads in the information from the 
# 
# This program uses data from the dataset described in the following publication:
#   [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
#   Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
#   Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
#   Vitoria-Gasteiz, Spain. Dec 2012
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# Function Name:    downloadData()
# Function Summary: This function will check to see if the data has already been downloaded. If 
#                   it has, then this function will just return. Otherwise, it will download
#                   the zip file and unpack it.
#----------------------------------------------------------------------------------------------
downloadData <- function()
{
    # check to see if the data directory exists...
    if (!file.exists("./UCI HAR Dataset"))
    {
        # if it DOESN'T exist, then download the file, unzip it, then delete the zip file.
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, dest = "./tempZip.zip", mode = "wb") 
        unzip("./tempZip.zip")
        file.remove("./tempZip.zip")
    }
}

#----------------------------------------------------------------------------------------------
# Function Name:    readRootDataFile()
# Function Summary: This function reads in a data file which resides in the main data subdir,
#                   parses it, then returns a list which is the second column of the file
#
# Parameters:       filename          the name of the test file to read, not including the path
#----------------------------------------------------------------------------------------------
readRootDataFile <- function(filename)
{
    # build up the full filename, including the relative path
    dataFilename <- sprintf("./UCI HAR Dataset/%s", filename)
    
    # read the data in
    fileData <- read.delim(dataFilename, header = FALSE, sep = " ", stringsAsFactors = FALSE)
    
    # return the 2nd column
    fileData[,2]
}

#----------------------------------------------------------------------------------------------
# Function Name:    determineIncludedFeatures()
# Function Summary: This function, when passed a list of features, will return a vector of 
#                   indices of feature names that contain either the mean of a variable, 
#                   or the standard deviation.
#
#                   This is for point 2 in the assignment directions.
#
# Parameters:       featureList          the complete list of features in the main dataset, as 
#                                        read in from the file in the unpacked root directory.
#----------------------------------------------------------------------------------------------
determineIncludedFeatures <- function(featureList)
{
    # look for mean() or std() in the list of strings. We need to use the double backslashes
    # to escape the parentheses, so they are treated as part of the string literal, and not 
    # a special character
    grep("mean\\(\\)|std\\(\\)", featureList)
}

#----------------------------------------------------------------------------------------------
# Function Name:    modifyVariableName()
# Function Summary: This function takes in a variable name from the original dataset and 
#                   manipulates it by removing the "-mean()" or "-std()" from the string, 
#                   concatentating the remaining pieces of the original variable name, and then
#                   appending either ".mean" or ".std" to the end of the name. This will be used
#                   when melting the data frame at the end.
#
# Parameters:       variableName    the variable to be modified
#----------------------------------------------------------------------------------------------
modifyVariableName <- function(variableName)
{
    # set some default values for some variables
    grepStr <- "-mean\\(\\)"
    newSuffix <- ".mean"
    
    # try looking for "-mean()" in the variable name
    grepMean <- grep(grepStr, variableName)
    
    # if the resulting list has zero length, then we're working with a "-std()" string
    if (length(grepMean) == 0)
    {
        grepStr <- "-std\\(\\)"
        newSuffix <- ".std"
    }

    # split the string based on the grep string. This will remove the grep string
    splitVariable <- strsplit(variableName, grepStr)
    
    # convert the resulting list back to a vector using unlist, and the combine them back 
    # to a single string
    splitVariable <- paste0(unlist(splitVariable), collapse = "")
    
    # append the new suffix to the variable name
    newVarName <- paste0(splitVariable, newSuffix)
    
    # replace the hyphens with underscores, as hyphens can't be used in a data frame variable name
    newVarName <- gsub("-", "_", newVarName)
    
    # return the new variable name
    newVarName
}

#----------------------------------------------------------------------------------------------
# Function Name:    loadDataset()
# Function Summary: This function needs to be passed the name of a subdirectory, and it will 
#                   read in the data from the three files contained in it, eliminate any 
#                   variables that are not required, and then combine the three data frames into
#                   one data frame, which will be returned
#
# Parameters:       subDirName          the name of the subdirectory containing the files
#                   requiredVariables   the indices of the variables required from the main 
#                                       dataset
#----------------------------------------------------------------------------------------------
loadDataset <- function(subDirName, requiredVariables)
{
    # build up the names of the data files we'll be reading
    subjectFilename <- sprintf("./UCI HAR Dataset/%s/subject_%s.txt", subDirName, subDirName)
    activityDataFilename <- sprintf("./UCI HAR Dataset/%s/y_%s.txt", subDirName, subDirName)
    mainDataFilename <- sprintf("./UCI HAR Dataset/%s/X_%s.txt", subDirName, subDirName)

    # read the subject file
    message(sprintf("Please wait: about to load %s...", subjectFilename))
    fileData <- read.delim(subjectFilename, header = FALSE, sep = " ", stringsAsFactors = FALSE)
    subjectData <- as.numeric(fileData[,1])

    # read the activity file, and convert the numeric version to a human readable version
    message(sprintf("Please wait: about to load %s...", activityDataFilename))
    fileData <- read.delim(activityDataFilename, header = FALSE, sep = " ", stringsAsFactors = FALSE)
    activityData <- as.numeric(fileData[,1])
    

    # read in the names of the full list of features, and figure out how many there are    
    featureList <- readRootDataFile("features.txt")
    numFeatures <- length(featureList)
    widths <- rep(16, numFeatures)

    # read the main data file; it's a fixed width format file, with each variable taking up 16 characters.
    # This is pretty slow, so print a warning to the console to warn the user.
    message(sprintf("Please wait: about to load %s - this may take some time...", mainDataFilename))
    fileData <- read.fwf(mainDataFilename, widths, header = FALSE)

    # only include the columns containing the required data
    observations <- fileData[,requiredVariables]

    # get the vector of variable names that we require    
    observationNames <- featureList[requiredVariables]
    
    # modify them, and convert the list back to a vector
    observationNames <- unlist(lapply(observationNames, modifyVariableName))
    
    # set the variable names on the data frame
    colnames(observations) <- observationNames
    
    # create a new data frame that has the activity, the subject number, then all the obsevations
    loadedData <- data.frame(activity = activityData, subject = subjectData, observations)
    
    # return the new data frame
    loadedData
}

#----------------------------------------------------------------------------------------------
# Function Name:    compileFullDataSet()
# Function Summary: This function reads in the datasets from the various files, stitches them
#                   together.
#
#                   The data frame that this function returns covers steps 1 to 4 of the 
#                   assignment briefing
#----------------------------------------------------------------------------------------------
compileFullDataSet <- function()
{
    # get the full list of features
    featureList <- readRootDataFile("features.txt")
    
    # figure out which features we're interested in
    requiredFeatures <- determineIncludedFeatures(featureList)
    
    # load the two separate datasets
    testDataset <- loadDataset("test", requiredFeatures)
    trainDataset <- loadDataset("train", requiredFeatures)
    
    # join the two datasets together
    fullDataset <- rbind(trainDataset, testDataset)
    
    # order the dataset by activity and then subject
    fullDataset <- fullDataset[with(fullDataset, order(activity, subject)), ]

    # return the full dataset
    fullDataset
}

#----------------------------------------------------------------------------------------------
# Function Name:    tidyDataset()
# Function Summary: This function takes in the dataset compiled from reading the data, and 
#                   converts it to the dataset requested in step 5 of the assignment brief
#
# Parameters:       dataset     The dataset created by the compileFullDataSet() function
#----------------------------------------------------------------------------------------------
tidyDataset <- function(dataset)
{
    # crete a new data frame by splitting the full dataset into chunks based on the
    # activity and subject columns, and calculate the mean of everythign else. 
    #   NOTE: for some odd reason, we need to put the key columns in reverse order in order 
    # for it to be sorted the way we want at the end.
    tidySet <- aggregate(dataset, list(dataset$subject, dataset$activity), mean)
    
    # the aggregate() function introduces two new columns into the dataset, so drop those.
    tidySet <- subset(tidySet, select = -c(Group.1, Group.2))

    # read the activity file into a factor variable
    activityInfo <- readRootDataFile("activity_labels.txt")
    
    # replace any underscores with spaces
    activityInfo <- unlist(lapply(activityInfo, gsub, pattern = "_", replacement = " "))
    
    # replace the numeric activity column with a human readable version
    # this is slightly out of order from the description in the assignment, as aggregate()
    # seemed to replace the activity strings with "NA" if I did it beforehand.
    tidySet$activity <- unlist(lapply(tidySet$activity, function(x) activityInfo[x]))
    
    # return the tidied data set
    tidySet
}


#----------------------------------------------------------------------------------------------
# Main Block - Anything below here is the main() function of the script.
#----------------------------------------------------------------------------------------------

# if required, download the zip file and unpack it in preparation for the rest of the analysis
downloadData()

# load and combine the training and test datasets, including selecting only the data relevant
# to this analysis.
fullSet <- compileFullDataSet()

# convert the full dataset into the tidy dataset requested in the assignment
tidyData <- tidyDataset(fullSet)

# write the tidy dataset out to a csv file
write.csv(tidyData, file = "tidydata.csv", row.names = FALSE)

