


#install packages to be used later
#if packages are not installed remove # from install.packages

#install.packages("caret")
library(caret) #for easily computing cross validation methods

#install.packages("ellipse")
library(ellipse) #for using ellipse function

#install.packages("e1071")
library(e1071) #implementation of SVM in R

#install.packages("kernlab")
library(kernlab)#implementation of KNN 

#install.packages("dplyr")
library(dplyr)#data manipulation

#install.packages("randomForest")
library(randomForest)#implementation of random forest


#Reading the dataset from files_used->iris.csv
dataset<-read.csv("G:/Akshat data/R_project_data/iris.csv", 
                  header=FALSE)

#assigning column names
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length",
                       "Petal.Width","Species")

head(dataset)

#types of columns in dataset
str(dataset)

#converting the species to factor as only 3 levels are their
levels(dataset$Species)
dataset$Species<-as.factor(dataset$Species)


# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

# select 20% of the data for validation
validation <- dataset[-validation_index,]

# use the remaining 80% of data to training and testing the models
dataset <- dataset[validation_index,]

#dimension of new dataset after removing validation
dim(dataset)

#distribution of different species in absolute numbers
table(dataset$Species)

#distribution of different species in percentages
percentage <- with(dataset, table(dataset$Species)) %>% prop.table()*100
print(percentage)

#summarise attribute distribution
summary(dataset)


# split input and output for data representation
#y for species and x for other variables
x <- dataset[,1:4]
y <- dataset[,5]

#barplot
plot(y)


# boxplot for each attribute on one image
par(mfrow=c(1,4))
  for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
  }

# scatterplot matrix
featurePlot(x=x, y=y ,plot="ellipse") #caret package
featurePlot(x=x, y=y ,plot="box") 

# density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# Run algorithms using 10-fold cross validation
trainControl <- trainControl(method="cv", number=10)#caret package
metric <- "Accuracy"

# evaluate 5 different algorithms:
# Linear Discriminant Analysis (LDA).
# Classification and Regression Trees (CART).
# k-Nearest Neighbors (KNN).
# Support Vector Machines (SVM) with a radial kernel.
# Random Forest (RF).

# LDA
set.seed(1)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric,
trControl=trainControl)

# CART
set.seed(1)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric,
trControl=trainControl)

# KNN
set.seed(1)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric,
trControl=trainControl)

# SVM
set.seed(1)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric,
trControl=trainControl)

# Random Forest
set.seed(1)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, 
trControl=trainControl)

# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, 
                          svm=fit.svm, rf=fit.rf))
summary(results)

# compare accuracy of models
dotplot(results)

# summarize Best Model
print(fit.lda)

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)
