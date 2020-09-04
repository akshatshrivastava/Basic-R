library(gapminder)
library(tidyr)
library(lubridate)
library(ggplot2)
library(dplyr)
library(gganimate)
library(gifski)
library(av)

#data file
data<-read.csv(file.choose(), header=T)

#plotting against day_no
data %>%
  ggplot(aes(x = day_no, y = total_cases)) +
  geom_line(color="#69b3a2")+
  geom_point(size = 1.5) +
  geom_area(fill="#69b3a2", alpha=0.5)+
  transition_reveal(total_cases)+
  ggtitle("Cumulative cases in US from 31 Jan 2020")+
  ylab("Cumulative cases in US")+
  theme_minimal()

anim_save('US Total cases')

          