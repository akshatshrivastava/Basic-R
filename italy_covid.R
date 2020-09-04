library(htmltools)
library(maps)
library(mapproj)
library(mapdata)
library(tidyverse)
library(ggmap)
library(leaflet)
library(leaflet.extras)

italy <- ggplot2::map_data( "italy")
italy_covid<-read.csv("G:/Rmlearning/datafiles/italy_covid.csv")
data<-merge(italy, italy_covid,
            by.x='region',
            by.y='Province_name')
ggplot(data, aes(x=long, y=lat, group=group, fill=Active_cases))+
     geom_polygon(color='black')+
     coord_map()+
     guides(fill=FALSE)+
     theme_void()+
     ggtitle("ITALY")
