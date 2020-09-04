df<-mtcars

#making car names a part of dataframe itself
df <- cbind(cars = rownames(mtcars), mtcars)
rownames(df) <- NULL

#shows first two rows of 'df'
head(df, n=2)

#showing cars with 4 cylinders
df%>%filter(cyl=='4')

#showing cars with 4 cylinders
#but arranged with mpg
df%>%filter(cyl=='4')%>%
     arrange(desc(mpg))

#creating a new column with name mpc
#and is defined a product of mpg&cyl
#and then arranging in desc order
df%>%mutate(mpc=mpg*cyl)%>%
     arrange(desc(mpc))

#create a seperate dataframe 
#with mean of mpg and n() denotes each row
df%>%summarise(mean = mean(mpg), n = n())

#self explanatory
df %>%group_by(cyl) %>%
     summarise(disp = mean(disp), sd = sd(disp))

#select function 
#selecting columns cars,cyl,mpg from df
df%>%select(cars,cyl,mpg)
