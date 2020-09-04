library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) 
library(caret)
library(ellipse)

df<-data.frame(iris[1:2])
y<-iris$Species

featurePlot(x=df, y=y, plot="ellipse")

k2 <- kmeans(df, centers = 3, nstart = 25)

fviz_cluster(k2, data = df)


