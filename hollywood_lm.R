
#for invkoing lm()
library(stats) 

#install.packages("plotrix")
#for editing abline
library(plotrix) 

#reading data from for_use->hollywooddata.csv
data=read.csv("G:/Akshat data/R_project_data/hollywooddata.csv", header=FALSE)

#renaming columns
colnames(data)<-c(
     "receipt_first","production_cost",
     "promotional_cost","book_sales")

#converting data to dataframe
data<-as.data.frame(data)

#first five rows of data
head(data)

#scatter plot among various variables in data
plot(data)

#linear regression among receipt_first and production cost
reprod<-lm(receipt_first~production_cost, data=data)
summary(reprod)

#Line of least squares

plot(data$production_cost,data$receipt_first, 
     col = "black", pch = 21, 
     bg = "grey", cex = 2,
     ylab = "", xlab = "",axes=FALSE
     )

#to introduce graphs on x and y axis
axis(1)
axis(2)

#introducing line for best fit
abline(reprod)

#x1 and x2 define darkening limits of line and lwd is line width
ablineclip(reprod, lwd = 2,col="red",x1 = 0, x2 = 17) 

#for staightening y label along y axis
#par(las = 0)


mtext("Production Cost", side = 1, line = 2.5, cex = 1.2)
mtext("Receipts", side = 2, line = 2, cex = 1.2)
text(4.5, 120, "slope =7.8 ", cex = 0.75)


