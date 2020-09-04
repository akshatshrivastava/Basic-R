install.packages("reshape2")
library(reshape2)
library(ggplot2)
data<-read.csv("G:/Rmlearning/datafiles/pop_data.csv")
popul<-melt(data, id="Country.Name")
colnames(popul) <-c("Country", "Year","Population")
ggplot(popul, aes(  x=Year, 
                    y=Population,
                    group=Country))+
geom_line(aes(colour=Country))+
geom_point(aes(colour=Country),size =3)+
     xlab("Year") +
     ylab("Population") +
     ggtitle("Population of BRICS + US + UK")+
     theme(aes(legend.title=element_text(family="Times",size=20)),
           legend.text=element_text(family="Times",face ="italic",size=15),
           plot.title=element_text(family="Times", face="bold", size=20),
           axis.title.x=element_text(family="Times", face="bold", size=12),
           axis.title.y=element_text(family="Times", face="bold", size=12))
    

