
#creating a dataframe
data <- data.frame(
     size = c(1.4, 2.6, 1.0, 3.7, 5.5, 3.2, 3.0, 4.9, 6.3),
     weight = c(0.9, 1.8, 2.4, 3.5, 3.9, 4.4, 5.1, 5.6, 6.3),
     tail = c(0.7, 1.3, 0.7, 2.0, 3.6, 3.0, 2.9, 3.9, 4.0))

#plotting scatter plot of data among each variables
plot(data)

#linear regression
sw<-lm(size~weight, data=data)

#summary of the sw
summary(sw)

#plotting line of least square value
plot(data$weight,data$size)
abline(sw,col="cyan")

#multiple regression
mr<-lm(size~weight+tail, data=data)
summary(mr)
