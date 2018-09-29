

# libraries 
library('tmap')
library('viridisLite')


# data 
data(Europe)

# make a variable to plot only Southern Europe countries
s_europe <- Europe$part == "Southern Europe"

# loop through s_europe and remove N/A 
for (i in seq_along(s_europe)) {
  if ( is.na(s_europe[[i]]) ) {
    s_europe[[i]] <- FALSE
  } 
}

# Reset the color palette for 4 variables
vir <- viridis(4)

# Map Southern Europe by population
tm_shape(Europe[s_europe,]) + 
  tm_borders() +   
  tm_fill(title = "Population Estimate (millions)",
          col = "pop_est", 
          palette = vir,
          labels = c("0 - 20",
                     "20 - 40", 
                     "40 - 60", 
                     "60 - 80")
  ) + 
  tm_style_white() + 
  tm_text("iso_a3", size="AREA", root=5) +
  tm_layout(title = "Southern Europe by Population",
            inner.margins = c(0.05, 0.1, 0.25, 0.05),
            scale = 0.85
  )
