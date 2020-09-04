library(rpart)
library(rpart.plot)

fit<-read.csv("D:/Rmlearning/CSV files/fitnessapplog.csv")
unique(fit$State)

tree<-rpart(PayOrNot~Incomes+State, data<-fit)
rpart.plot(tree)
