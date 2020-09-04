# Part 1
# Write a function that calculates Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 
# 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from 
# the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring 
# any missing values coded as NA.

# Gather together the same column from the 322 files first


setwd("D:/Rmlearning/specdata")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  file_list <- list.files(directory, full.names = TRUE) #create a list of files
  dat <- data.frame() #create an empty data frame to accommodate all files
  for (i in id) {
    dat <- rbind(dat, read.csv(file_list[i]))
    #loop through all the files and rbind them together into the data frame
  }
  mean(dat[, pollutant], na.rm = TRUE)
  #return the mean of the pollutant across all monitors list
}

# Part 2
# Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name of the file and the second column is the number 
# of complete cases.



setwd("D:/Rmlearning/specdata")
complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.names = TRUE) #create a list of files
  dat <- data.frame()
  for (i in id) {
    #loop through all the files
    temp <- read.csv(files[i])
    #delete all the rows with NAs
    temp <- na.omit(temp)
    tNobs <- nrow(temp)
    #count of the rows of complete data
    dat <- rbind(dat, data.frame(i, tNobs))
    #enumerate the complete cases by index
  }
  dat
  #return the final data frame
}

# Part 3
# Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between 
# sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the 
# threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors 
# meet the threshold requirement, then the function should return a numeric vector of length 0.


setwd("D:/Rmlearning/specdata")
corr <- function(directory, shreshold = 0) {
  #create a file list
  files <- list.files(directory, full.names = TRUE)
  #create an empty vector
  dat <- vector(mode = "numeric", length = 0)
  #loop through all files
  for (i in 1:length(files)) {
    temp <- read.csv(files[i])
    #remove all NAs
    temp <- temp[complete.cases(temp), ]
    #count the number of observed cases
    sum_complete <- nrow(temp)
    if (sum_complete > shreshold){
      dat <- c(dat, cor(temp$sulfate, temp$nitrate))
    }
  }
  dat
}


# Script to get the pollutant mean


setwd("D:/Rmlearning/specdata")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  file_list <- list.files(directory, full.names = TRUE) #create a list of files
  dat <- data.frame() #create an empty data frame to accommodate all files
  for (i in id) {
    dat <- rbind(dat, read.csv(file_list[i]))
    #loop through all the files and rbind them together into the data frame
  }
  mean(dat[, pollutant], na.rm = TRUE)
  #return the mean of the pollutant across all monitors list
}


pollutantmean("D:/Rmlearning/specdata", "sulfate", 1:10)

pollutantmean("D:/Rmlearning/specdata", "nitrate", 70:72)

pollutantmean("D:/Rmlearning/specdata", "sulfate", 34)

pollutantmean("D:/Rmlearning/specdata", "nitrate")

cc <- complete("D:/Rmlearning/specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)


cr <- corr("D:/Rmlearning/specdata", 2000)                
n <- length(cr)                
cr <- corr("D:/Rmlearning/specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))


cr <- corr("D:/Rmlearning/specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("D:/Rmlearning/specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


  
set.seed(42)
cc <- complete("D:/Rmlearning/specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])