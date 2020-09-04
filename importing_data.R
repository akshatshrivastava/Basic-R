df <- read.delim("D:/Rmlearning/trump_inaug.txt", 
                 header = FALSE)

df2 <- read.delim2("D:/Rmlearning/trump_inaug.txt", 
                 header = FALSE)


df3<-read.table("D:/Rmlearning/CSV files/trump_inaug.txt", 
                header = FALSE)

df4<-read.csv("D:/Rmlearning/CSV files/iris.csv",
              sep = ',')

library(readxl)
df5 <- read_excel("YOUR FILE PATH")


library(rjson)

json1 <- fromJSON(file= "YOUR FILE PATH" )

json2 <- fromJSON(file= "YOUR URL PATH" )



library(XML)
xml1 <- xmlTreeParse("YOUR FILE PATH")

xml2 <- xmlTreeParse("YOUR URL PATH")

library(XML)

doc.html = htmlTreeParse('C:/Users/PC 6/Downloads/npas.html',
                         useInternal = TRUE)


library(sas7bdat)

mySASData <- read.sas7bdat("YOUR SAS FILE PATH")

library(haven)

mySASData <- read_sas("YOUR SAS FILE PATH")



library(foreign)

mySPSSData <- read.spss("YOUR SPSS FILE PATH")



library(foreign)

mySTATAdata <- read.dta("YOUR STATA FILE PATH")



library(foreign)

mySYSTATdata <- read.systat("YOUR SYSTAT FILE PATH") 



library(foreign)

myMTPData <- read.mtp("YOUR MINITAB FILE PATH")



















