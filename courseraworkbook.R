x<-matrix(1:6,2,3)
x
for (i in seq_len(ncol(x))){
     for (j in seq_len(nrow(x))){
          print(x[i,j])
     } 
}
#Program for prime upto 100
for(i in 1:100){
     if(i<=1 || i%%2==0 || i%%3==0 
        || i%%5==0|| i%%7==0){
          next
     }
      print(i)    
}
     
cube <- function(x, n) {
     x^3
}
cube(3)


f <- function(x) {
     g <- function(y) {
          y + z
     }
     z <- 4
     x + g(x)
}
z <- 10
f(3)


x <- 5
y <- if(x < 3) {
     NA
} else {
     10
}
y

h <- function(x, y = NULL, d = 3L) {
     z <- cbind(x, d)
     if(!is.null(y))
          z <- z + y
     else
          z <- z + f
     g <- x + y / z
     if(d == 3L)
          return(g)
     g <- g + 10
     g
}
help("rnorm")

x<-list(a=1:6, b=rnorm(10))
l<-lapply(x, mean)
l#return two vectors
class(l)
s<-sapply(x,mean)
class(s)
s

x<-matrix(1:4,2,2)

rowSums<-apply(x,1, sum )#1 for row
rowMeans<-apply(x,1,mean)
colSums<-apply(x,2,sum)#2 for column
colMeans<-apply(x,2,mean)

q<-apply(x ,1, quantile, probs=c(0.1))

data(iris)
class(iris)

#tapply an operation on a subset of a dataframe
k<-tapply(iris$Sepal.Width,iris$Species, mean)
class(k)

#split 
split(iris$Sepal.Width, iris$Species)

tapply(iris$Sepal.Length,iris$Species, mean)

data("mtcars")
mtcars
tapply(mtcars$hp, mtcars$cyl, mean)

#getting and setting working directory
getwd()
setwd()

#for xl files
install.packages("openxlsx")
library(openxlsx)
cameraData<-openxlsx::read.xlsx("C:/Users/JMC/
                                Downloads/bank.xlsx"
                      )

#for json
install.packages("jsonlite")
library(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")
head(jsonData)
names(jsonData)#shows only column name
names(jsonData$owner)

iris_js<-toJSON(iris, pretty=TRUE)
names(iris_js)
head(iris_js)

x<-read.csv("C:/Users/JMC/Downloads/getdata.csv")
