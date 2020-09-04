# Create a data frame from the main data set.
iris.data <- data.frame(iris$Sepal.Length, iris$Sepal.Width)

# Create a table with the needed variables.
iris.data.t <- data.frame(iris$Sepal.Length, iris$Sepal.Width)
print(iris.data.t)

# Perform the Chi-Square test.
print(chisq.test(iris.data.t))

mt.data<-table(mtcars$cyl, mtcars$wt)



print(chisq.test(mt.data))