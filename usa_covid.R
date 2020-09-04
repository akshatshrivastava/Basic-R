#######################PACKAGES#########################
library(htmltools)
library(maps)
library(mapproj)
library(mapdata)
library(tidyverse)
library(ggmap)
library(leaflet)
library(leaflet.extras)

#######################HEATMAP#########################
#plotting map of United States
usa <- ggplot2::map_data( "state")
ggplot(usa, aes(x=long, y=lat, fill=region))+
     geom_polygon(color='black')+
     coord_map()+
     guides(fill=FALSE)+
     theme_void()+
     ggtitle("USA")

#extracting covid data for USA
usa_d<-read.csv("D:/Rmlearning/CSV files/us-states.csv")
usa_covid<-usa_d%>%filter(date=="2020-06-12")%>%
                   arrange(desc(cases))

#converting the state column to lowercase
usa_covid$state<-tolower(usa_covid$state)

#merging the us map data and us covid data
final_state_data<-merge(usa, usa_covid,
            by.x='region',
            by.y='state')

#plotting the covid data on US map
ggplot(final_state_data, aes(x=long, y=lat, group=group, fill=cases))+
     geom_polygon(color='black')+
     coord_map()+
     ggtitle("USA COVID CASES")+
     scale_fill_gradient2(high='red')+
     theme_void()+
     guides(fill=F)

#######################BUBBLE PLOT#########################
#leaflet
leaflet() %>% addTiles()

#names of all providers
names(providers)

#adding provider to the leaflet
#marking the centre of US i.e.Belle Fourche, South Dakota
leaflet() %>% addProviderTiles("OpenStreetMap") %>% 
        setView(lng=-103.46, lat=44.58, zoom=5)  %>% 
        addCircleMarkers(lng=-103.46, 
                   lat=44.58,
                   radius=10,
                   color='red')

#covid date by counties
final_county_data<-read.csv("D:/Rmlearning/CSV files/final_usa_county.csv",
                    header=T)

#setting the color palette
mycolor<-colorNumeric(palette = "RdBu",
                      domain = c(1:209878),
                      reverse=T)

final_county_data %>% 
        leaflet() %>% 
        addProviderTiles("Esri.WorldImagery") %>% 
        addCircleMarkers(radius= ~0.0007*Confirmed,
                         color= ~mycolor(Confirmed)) %>% 
                         addLegend(pal = mycolor,
                                   values = c(1:209878),
                                   opacity=0.9,
                                   title = "Confirmed cases",
                                   position = 'topright')
# #popup= ~paste0(county,
#                "<br/>",
#               Confirmed))


####################ANALYTICS############################
library(covid19.analytics)

#downloading the world data
conf<-covid19.data(case="ts-confirmed")
recov<-covid19.data(case="ts-recovered")
deaths<-covid19.data(case="ts-deaths")

#plotting for US
totals.plt(conf, c("US"))
totals.plt(recov, c("US"))
totals.plt(deaths, c("US"))


#totals per location
tots.per.location(conf, geo.loc = 'US')

#growth rate for US
growth.rate(conf, geo.loc = 'US')
growth.rate(recov, geo.loc = 'US')
growth.rate(deaths, geo.loc = 'US')

#data file for animated US covid cases
data<-read.csv("D:/Rmlearning/CSV files/us_coviddata_date.csv", 
               header=T)

#animated plotting against day_no for US
data %>%
     ggplot(aes(x = day_no, y = total_cases)) +
     geom_line(color="#69b3a2")+
     geom_point(size = 1.5) +
     geom_area(fill="#69b3a2", alpha=0.5)+
     transition_reveal(total_cases)+
     ggtitle("Cumulative cases in US from 31 Jan 2020")+
     ylab("Cumulative cases in US")+
     theme_minimal()

#saving the animation
anim_save('US Total cases')

#SIR Model
generate.SIR.model(conf, 'US', tot.population = 331002651)



