# Getting And Cleaning Data Assignment
## Geoff Skellams - 2017

## Introduction

This repository contains the files created to answer the **Getting And Cleaning Data** course assignment, part of the [Johns Hopkins University](http://www.jhu.edu) Data Science Specialisation, offered through [Coursera.com](http://www.coursera.com).

The aim of the assignment was to create a tidy dataset meeting a certain set of requirements, thereby showing that the student had understood the course material. A link to some raw data files was provided (see the References section below for a link). The data provided was spread across several files, which all had to be read into memory and combined together, before tidying the results and writing the final dataset out to a file.

---

## Tidy Data Discussion

### Selection of Variables from the raw dataset

The assignment included the following requirement statement as to what subset of the raw dataset to include:

> Extracts only the measurements on the mean and standard deviation for each measurement.

After examining the raw data, I felt that given the large number of variables in the original dataset, only the variables containing the substrings **mean()** or **std()** would be included in the final tidy dataset. While a small number of the original variables contained the substring "mean" (particularly the Angle variables), I did not interpret these as being the mean of these variables. Instead, they seemed to be a calculated value based on other variables, so I excluded them based on that assumption.

### The Final Tidy Dataset
The output of the **run_analysis.R** script is a wide dataset. Each row of the table contains all of the values for the calculations based on the activity and the subject number. Each of the data columns is independent of every other column, and each column only contains data relating to one variable. Several columns may be related (for example, the X, Y & Z-axis values for a similar calculation), however, I considered these to be separate variables, as it is theoretically possible to change the value in one axis only *without* changing the values in the other two directions (in practice, this would be exceptionally difficult for a human).

### Transformations Performed on the Raw Dataset
The following steps were used to create the tidy dataset:
1. Load the full list of feature names from the **features.txt** file.
2. Create a vector of indices of feature names containing either **mean()** or **std()**.
3. For each of the **test** and **train** datasets:
    1. Load the data from the **subject_ZZZ.txt** file (where ZZZ corresponds to either "test" or "train") and extract out a vector containing which subjects performed which observation.
	2. Load the data from the **y_ZZZ.txt** file (where ZZZ corresponds to either "test" or "train") and extract out a vector containing the activity numbes performed for each observation.
    3. Load the data from the **X_ZZZ.txt** file (where ZZZ corresponds to either "test" or "train") and extract out a data frame containing all of the observations of all the features.
    4. Using the vector created in step 2, create a subset of the data frame, containing all the rows, but only the subset of columns we're interested in.
    5. Create a vector of the variable names using the vector of indices created in step 2.
    6. Modify the names of each variable, as described below (see [**Modification of the Original Feature Names**](#Modification-of-the-Original-Feature-Names))
    7. Add the variable names to the data frame created in step iv.
    8. Create a new data frame by combining the vectors in steps i, ii and vii.
4. Combine the two data frame created in step 3 into one data frame.
5. Sort the data frame according to **activity** and **subject**.
6. Create a new data frame by calculating the mean of each variable when the data frame is split according to activity and subject.
7. Replace the activity numeric values with human readable versions.

### Modifcation to the Original Feature Names
The original feature names are a combination of the type of measurement, what calculation had been performed on it, and optionally, which axis the data was referring to. For example, **tBodyAcc-mean()-X** refers to the mean of the body linear acceleration time series calculations along the X-axis.

I had originally thought to convert the dataset into a tall narrow dataset, and felt that the original format did not lend itself to a straight forward conversion. To assist in the melting of the dataset, I coverted all of the feature names to a new format. I split the string using either "-mean()" or "-std()", and then joined the two parts together (noting that if there was no axis at the end, then the second part was a null string). I then appended either ".mean" or ".std" to the end of the new variable name.

Finally, I replaced all the hyphens with underscores, as when I assigned the variable names to the data frame, it automatically converted the hyphens to full stops ("."). As I only wanted to have one full stop in the string, I used underscores, which were permitted in the data frame variable names.

Thus, **tBodyAcc-mean()-X** became **tBodyAcc_X.mean**.

If the wide dataset is required to be converted to a tall one, it would be a relatively simple matter to melt the wide data set on the activity and subject fields, then split the variable name into two columns, "measurement" and "calculation", based on the position of the full stop character. For example, **tBodyAcc_X.mean** would split to a measurement value of **tBodyAcc_X** and a calculation value of **mean**.

### Tidy Dataset Variable Meanings

For the meanings of all variables in the tidy dataset, please see the [Project Codebook](https://github.com/Eynowd/GettingAndCleaningDataAssignment/blob/master/codebook.md).

---

## Setting the Working Directory

Before the tidy data can be loaded, or the R script to create it can be run, the user will need to point their R environment at the directory containing the data file and the script. To do this:

1. Start an R interactive session.
2. Set the session's working directory to the directory containing the **run_analysis.R** script.
    * How this is achieved will depend on the user's R environment.
    * See the R documentation for your specific environment for instructions on how to set the working directory.


## Loading the Tidy Data File Into R

To load the tidy datset into memory and examine its contents, use the following command in the R environment:

```R
tidyDataSet <- read.table("tidydata.txt", header = TRUE)
View(tidyDataSet)
```

## Running the R Script

To run the **run_analysis.R** script, load the script into the R environment by using the command:

```R
source("run_analysis.R")
```

The script will automatically check to see if the current folder contains the source data files directory.
  * If the source data is **not** present, the R script will automatically download and unzip it to the current working directory before continuing.

The **tidydata.txt** file will automatically be created at the end of the script. It will be placed in the current working folder.


> #### _Please be aware_
> Due to the size of the datasets being loaded into memory, the script can take several minutes to complete. I have included progress messages when the script is about to start loading data from files, to inform the user about the script's progress.

---


## References

This script uses the dataset discussed in the following paper:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
> **Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
> Vector Machine.** International Workshop of Ambient Assisted Living (IWAAL 2012). 
> Vitoria-Gasteiz, Spain. Dec 2012

  * The dataset itself can be [found here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The author also used the following webpage as a reference while writing the code, including the code snippet for reading the tidy dataset into R:

> [David Hood's discussion on _Getting and Cleaning the Assignment_](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)


