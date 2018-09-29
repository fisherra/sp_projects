# airbnb in greece

# libraries 
library('tidyverse')
library('classInt')
library('ggmap')

# load the stored airbnb .csv file
athens_airbnb <- read_csv("r_spatial/greece/input/airbnb_data.csv")

# google and set coordinates for the city of athens
athens_coord <- c(lon = 23.7325, lat = 37.9868)

# from classInt package, divide airbnb prices into 5 categories 
classIntervals(athens_airbnb$price, n = 5, style = "quantile")
breaks <- c(9,25,35,46,69,5000)
labels <- c("$9 - $25", "$25 - $35", "$35 - $46", "$46 - $69", "$69+")
athens_airbnb$price <- cut(athens_airbnb$price, breaks = breaks, labels = labels)

# retrieve map for athens based on coordinates
athens <- get_map(athens_coord, zoom = 13, scale = 1, maptype="terrain")

# remove NA prices 
athens_airbnb <- athens_airbnb %>%
  filter(!is.na(price))

# Plot airbnb by price in Athens
ggmap(athens) + 
  geom_point(data = athens_airbnb, 
             aes(longitude, latitude, col = price), 
             alpha = 0.5) + 
  theme_set(theme_bw()) + 
  theme(legend.key=element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank()) + 
  scale_color_manual(name = "Price per Night", 
                     values = c("#0D0887FF", "#7E03A8FF", "#CC4678FF", "#F89441FF", "#F0F921FF"))
