library(ggplot2)
library(mandelbrot)

mb <- mandelbrot(xlim = c(-0.8335, -0.8325),
                 ylim = c(0.205, 0.206),
                 resolution = 1200L,
                 iterations = 1000)

# vaccination heatmap palette
cols <- c(
     colorRampPalette(c("#e7f0fa", "#c9e2f6", "#95cbee",
                        "#0099dc", "#4ab04a", "#ffd73e"))(10),
     colorRampPalette(c("#eec73a", "#e29421", "#e29421",
                        "#f05336","#ce472e"), bias=2)(90),
     "black")

df <- as.data.frame(mb)

ggplot(df, aes(x = x, y = y, fill = value)) +
     geom_raster(interpolate = TRUE) + theme_void() +
     scale_fill_gradientn(colours = cols, guide = "none")
dev.off()
