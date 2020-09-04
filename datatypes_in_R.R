x <- c(1,2,7.3,-2) # numeric vector
y <- c("one","two","three") # character vector
z <- c(TRUE,FALSE,TRUE,FALSE) #logical vector

x[c(2,4)] # extracting 2nd and 4th elements of vector

# generates 5 x 4 numeric matrix
y<-matrix(1:20, nrow=5,ncol=4)

# another example
cells <- c(1,2,3,4)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))


d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f) #defining a data frame
names(mydata) <- c("ID","Color","Passed") # variable names


# example of a list with 4 components -
# a string, a numeric vector, a matrix, and a scaler
w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)

# lists can be concatenated as well
v <- c(list1,list2)


# variable gender with 10 "male" entries and
# 20 "female" entries
gender <- c(rep("male",10), rep("female", 20))
gender <- factor(gender)