library(mapdata)
library(ggplot2)
library(tidyverse)

global <- map_data("state")
mydata <- as_tibble(global)

mydata %>% filter( region == "california") -> california

load("C:/Users/brent/Documents/Classes/Data_Visualization/Tables/wind_turbines.rda")
mydata2 <- as_tibble(wind_turbines)

mydata2 %>% filter( t_state == "CA") -> wind_ca

gg1 <- ggplot() + geom_polygon(data = california, aes(x=long, y = lat, group = group), color="blue") + 
  coord_fixed(1.3)

gg1 + geom_point(data=wind_ca, aes(xlong, ylat, fill="none"), color="red")