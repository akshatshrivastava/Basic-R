#mtcars is a dataset for various parameters of 
#different models of a car

data(mtcars)
df<-as.data.frame(mtcars) #converting mtcar to dataframe

wtandmpg <- mtcars[,c('wt','mpg')]#extracting wt and mpg
print(head(wtandmpg))

plot(x = df$wt,y = df$mpg,
     xlab = "Weight",
     ylab = "Mileage",
    	main = "Weight vs Milage"
)


pairs(~wt+mpg+disp+cyl,data = mtcars,
      main = "Scatterplot Matrix")














