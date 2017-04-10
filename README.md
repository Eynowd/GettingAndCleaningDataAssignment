# Getting And Cleaning Data Assignment
## Geoff Skellams - 2017

## Introduction

This repository contains the files created to answer the **Getting And Cleaning Data** course, part of the [Johns Hopkins University](http://www.jhu.edu) Data Science Specialisation, offered through [Coursera.com](http://www.coursera.com).

The aim of the assignment was to create a tidy dataset meeting a certain set of requirements, thereby showing that the student had understood the course material. A link to some raw data files was provided (see the References section below for a link). The data provided was spread across several files, which all had to be read into memory and combined together, before tidying the results and writing the final dataset out to a file.

---

## Tidy Data Discussion

For a full discussion on the output of the **run_analysis.R** script, including a justification of which variables were included, and the meanings of all variables, please see the [Codebook](https://github.com/Eynowd/GettingAndCleaningDataAssignment/blob/master/codebook.md)

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


