library(htmltools)
library(maps)
library(mapproj)
library(mapdata)
library(tidyverse)
library(ggmap)
library(leaflet)
library(leaflet.extras)

usa <- ggplot2::map_data( "India", exact=FALSE)
ggplot(usa, aes(x=long, y=lat, fill=region))+
  geom_polygon(color='black')+
  coord_map()+
  guides(fill=FALSE)+
  theme_void()+
  ggtitle("USA")

india_state_data<-read.csv("D:/Rmlearning/CSV files/india_covid.csv",
                            header=T)

india_covid<-india_state_data %>%
                    filter(Date=="6/22/2020")
  

#setting the color palette
mycolor<-colorNumeric(palette = "RdBu",
                      domain = c(1:142075),
                      reverse=T)

india_state_data %>% 
  leaflet() %>% 
  addProviderTiles("OpenStreetMap") %>% 
  addCircleMarkers(radius= ~0.0002*Confirmed,
                   color= ~mycolor(Confirmed),
                   opacity = 0.1) %>% 
  addLegend(pal = mycolor,
            values = c(1:142075),
            opacity=0.9,
            title = "Confirmed cases",
            position = 'topright')
