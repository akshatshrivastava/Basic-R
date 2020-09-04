data(iris)
d <- density(iris$Sepal.Length) 
# above function retunrn 
#the density data and stores in 'd'
plot(d) 

library(ggplot2)
p <- ggplot(iris, aes(x=Sepal.Length)) + 
     geom_density()+theme_classic()
print(p)

plot(d, main="Sepal Length")
polygon(d, col="green", border="black")

ggplot(iris, aes(x=Sepal.Length))+
     geom_density(color="black", fill="green")


library(gridExtra)
p1<-ggplot(iris, aes(x=Sepal.Length, fill=Species)) +
     geom_density(alpha=1)
p2<-ggplot(iris, aes(x=Sepal.Length, fill=Species)) +
     geom_density(alpha=0.6)
grid.arrange(p1, p2, ncol=2)

View(iris)
