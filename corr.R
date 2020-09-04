library(corrplot)

#correlation between Sepal Length and Sepal Width
cor(iris[1:2])

#correlation between Petal Length and Petal Width
cor(iris[3:4])

nospecies <- cor(iris[1:4])
cr<-corrplot(nospecies)


corrplot(cr,method="pie")
corrplot(cr,method="ellipse")
corrplot(cr,method="number")
require(psych)
  
pairs.panels(iris[1:4], hist.col="cyan")
