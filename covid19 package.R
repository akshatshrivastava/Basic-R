library(nCov2019)
x = get_nCov2019(lang='en')
y =load_nCov2019(lang='en')

dashboard(lang='en')
plot(x)






plot(x, palette="Purples")


library(usmap)
help(usmap)
cn<-get_map_us()
plot(x, region='US',usmap=cn  font.size=2)
plot_usmap(x)

library(nCov2019)
nCov2019_set_country(country = 'Italy') 
x['province',] # this will return Italy data only.
