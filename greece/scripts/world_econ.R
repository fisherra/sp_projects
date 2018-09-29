# world map economic development

# libraries 
library('tmap')
library('viridisLite')

# Create a custom color palette
vir <- viridis(5)

# Plot the world based on economic development
tm_shape(World) + 
  tm_borders() + 
  tm_compass() + 
  tm_fill(title ="Economic Development",
          col = "economy",
          palette = vir,
          style = "quantile"
  ) 

# Load tmap package data on Europe
data(Europe)

# Plot a map of Europe based on geographic divisions
tm_shape(Europe) + 
  tm_borders() + 
  tm_fill(title = "Part",
          col = "part",
          palette = vir,
          textNA = "Not Europe"
  ) + 
  tm_style_white() 

