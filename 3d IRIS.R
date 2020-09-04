library(rgl)
library(magick)
library(rglwidget)

# Let's use the iris dataset
# iris

# This is ugly
colors <- c("royalblue1", "darkcyan", "oldlace")
iris$color <- colors[ as.numeric( as.factor(iris$Species) ) ]

# Static chart
plot3d( iris[,1], iris[,2], iris[,3], 
        col = iris$color, type = "s", radius = .1)

# We can indicate the axis and the rotation velocity
play3d(spin3d( axis = c(0, 0, 1), rpm = 20), duration = 10 )

# Save like gif
movie3d(
  movie="3dAnimatedScatterplot", 
  spin3d( axis = c(0, 0, 1), rpm = 7),
  duration = 10, 
  dir = "Your Directory",
  type = "gif", 
  clean = TRUE
)

install.packages("rgl")
install.packages("magick")
install.packages("rglwidget")