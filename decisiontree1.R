library(party)

data<- read.csv("D:/Rmlearning/CSV files/Cardiotocographic.csv")
head(data, n=4)
str(data)

data$NSPF <-factor(data$NSP)

set.seed(1234)
pd<-sample(2, nrow(data), replace = TRUE, prob=c(0.8, 0.2))
train<- data[pd==1,]
validate <- data[pd==2,]

dim(data)
dim(train)
dim(validate)


tree<-ctree(NSPF~LB+AC+FM, data = train)
plot(tree)

tree2<-ctree(NSPF~LB+AC+FM, data=train, 
             controls = ctree_control(mincriterion = 0.9, minsplit = 500))
plot(tree2)

#Predict
predict(tree, validate)

tab<-table(predict(tree), train$NSPF)
print(tab)
