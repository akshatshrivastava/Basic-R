library(caret)

data("BostonHousing")

#################################################################################
# crim                                                                          #               
# per capita crime rate by town.                                                #
#                                                                               #
# zn                                                                            #
# proportion of residential land zoned for lots over 25,000 sq.ft.              #
#                                                                               #
# indus                                                                         #
# proportion of non-retail business acres per town.                             #
#                                                                               #
# chas                                                                          #
# Charles River dummy variable (= 1 if tract bounds river; 0 otherwise).        #
#                                                                               #
# nox                                                                           #
# nitrogen oxides concentration (parts per 10 million).                         #
#                                                                               #
# rm                                                                            #
# average number of rooms per dwelling.                                         #
#                                                                               #
# age                                                                           #
# proportion of owner-occupied units built prior to 1940.                       #
#                                                                               #
# dis                                                                           #
# weighted mean of distances to five Boston employment centres.                 #
#                                                                               #
# rad                                                                           #
# index of accessibility to radial highways.                                    #
#                                                                               #
# tax                                                                           #
# full-value property-tax rate per $10,000.                                     #
#                                                                               #
# ptratio                                                                       #
# pupil-teacher ratio by town.                                                  #
#                                                                               #
# black                                                                         #
# 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town.               #
#                                                                               #
# lstat                                                                         #
# lower status of the population (percent).                                     #
                                                                                #     
# medv                                                                          #
# median value of owner-occupied homes in $1000s.                               #
                                                                                #
#################################################################################

train_set<-createDataPartition(BostonHousing$rm,p=.8,list = FALSE)
test_set<-BostonHousing[-train_set,]
train_set<-BostonHousing[train_set,]
dataset<-as.data.frame(train_set)

dim(BostonHousing)
dim(train_set)
dim(test_set)

sapply(dataset, class)
dataset$chas<-as.numeric(dataset$chas)

corn<-cor(dataset[,1:13])
corrplot(corn, method="circle")

# Run algorithms using 10-fold cross validation
trainControl <- trainControl(method="repeatedcv", number=10, repeats=3)
metric <- "RMSE"

