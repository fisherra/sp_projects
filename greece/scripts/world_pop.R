# Spatial Analysis Project - Greece 
# Fisher Ankney 

# libraries 

# install.pakage('tidyverse')
# install.packages('tmap')

library('tidyverse')    
library('tmap')


# Load World dataset from package tmap
data("World")

# Plot the world according to population
tm_shape(World) + 
  tm_borders() +
  tm_fill(title = "Population Estimate", 
          col = "pop_est", 
          style = "fisher",
          labels = c("0 - 33 Million",
                     "33 - 105 Million",
                     "105 - 220 Million", 
                     "220 - 740 Million", 
                     "740 - 1,339 Million"
          )
  ) + 
  tm_style_natural() + 
  tm_compass() + 
  tm_layout(frame = F)
