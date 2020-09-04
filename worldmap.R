library(htmltools)
library(maps)
library(mapproj)
library(mapdata)
library(tidyverse)
library(ggmap)
library(leaflet)
library(leaflet.extras)

#world map 
all<-map_data('world')
ggplot(all, aes(x=long, y=lat, group=group, fill=region))+
     geom_polygon(color='black')+
     guides(fill=FALSE)

#plotting map of Canada, USA and Mexico
#creating obj canusamex for storing data of Canada,USA& Mexico
canusamex<-map_data('world', 
                    region=c("Canada","USA","Mexico"))
ggplot(canusamex, aes(x=long, y=lat, group=group, fill=region))+
     geom_polygon(color='black')+
     coord_map()+
     xlim(-180,-50)

#plotting map of Italy
italy_map <- ggplot2::map_data(map = "italy")
ggplot(italy_map, aes(x=long, y=lat, fill=region))+
     geom_polygon(color='black')+
     coord_map()+
     guides(fill=FALSE)
     

     