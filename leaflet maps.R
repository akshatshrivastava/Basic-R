library(leaflet)

# Note: if you do not already installed it, install it with:
# install.packages("leaflet")

names(providers)
# Background 1: NASA
a <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% 
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
a

# Background 2: World Imagery
b <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldImagery")
b

# Background 3: Gray Canvas
c <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldGrayCanvas")
c

# Background 4: World Terrain
d <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldTerrain")
d

# Background 5: World Topo Map
e <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldTopoMap")
e


z <- leaflet()%>% 
  addTiles() %>% 
  setView(lng = -71.0589, lat = 42.3601, zoom = 12)
z

r<- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("OpenSeaMap" )
r
