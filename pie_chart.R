library(ggplot2)
     cars=c("Dogs", "Cats", "Fish", "Rabbit", "Others")
     perc=c(55, 30, 6, 5, 4)

#Using pie function
pie(perc, labels=cars,
    density=10,angle=c(20,90,30,10,0),
    main="Pie Chart")

# Prepare a color palette. Here with R color brewer:
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2") 

# You can change the border of each area with the 
#classical parameters:
pie(perc, labels = cars, 
    border="white", col=myPalette,
    main="Pie Chart of Pet")

df<-data.frame(
     cars=c("Dogs", "Cats", "Fish", "Rabbit", "Others"),
     perc=c(55, 30, 6, 5, 4))

# Basic piechart
ggplot(df, aes(x="", y=perc, fill=cars)) +
     geom_bar(stat="identity", width=1, color="white") +
     coord_polar("y", start=0) +
     
     theme_void() # remove background, grid, numeric labels
