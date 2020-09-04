data(iris)
plot(iris$Petal.Length, iris$Petal.Width)

mouse.regression<-lm(size~weight, data=mouse.data)
mouse.regression
summary(mouse.regression)
abline(mouse.regression, col="red")


data(mtcars)

plot(mtcars$mpg, mtcars$hp)

reg<-lm(hp~mpg, data=mtcars)

abline(reg, col="red")

reg
model <- lm( y ~ x, data = data)
abline (model, col = 'color')

p3 <- ggplot(mtcars, aes(x=mpg, y=hp)) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_minimal()
p3
