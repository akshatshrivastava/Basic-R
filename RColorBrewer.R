library(RColorBrewer)

display.brewer.all()

display.brewer.pal(n = 8, name = 'Dark2')

brewer.pal(n = 8, name = "Dark2")

library("ggplot2")
# Box plot: changing the fill color by Species
bp <- ggplot(iris, aes(Species, Sepal.Length)) + 
  geom_boxplot(aes(fill = Species)) +
  theme_minimal() +
  theme(legend.position = "top")
bp

# Box plot
bp + scale_fill_brewer(palette = "Dark2")

barplot(c(2,5,7), col = brewer.pal(n = 3, name = "RdBu"))
