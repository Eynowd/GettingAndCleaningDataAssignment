# Codebook
# Getting And Cleaning Data Assignment
## Geoff Skellams - 2017
### Variable Selection

## Tidy Data Discussion

The assignment included the following requirement statement as to what subset of the raw dataset to include:

> Extracts only the measurements on the mean and standard deviation for each measurement.

After examining the raw data, I felt that given the large number of variables in the original dataset, only the variables containing the substrings **mean()** or **std()** would be included in the final tidy dataset. While a small number of the original variables contained the substring "mean" (particularly the Angle variables), I did not interpret these as being the mean of these variables. Instead, they seemed to be a calculated value based on other variables, so I excluded them based on that assumption.

