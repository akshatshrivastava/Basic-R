library(ggplot2)
data(mtcars)

# prepare hierarchical cluster
hc = hclust(dist(mtcars))

# very simple dendrogram
plot(hc)


# load package ape;
library(ape)

# plot basic tree
plot(as.phylo(hc), cex = 0.9, label.offset = 1)

plot(as.phylo(hc), type = "fan")

# install.packages('sparcl')
library(sparcl)
# colors the leaves of a dendrogram
y = cutree(hc, 3)
ColorDendrogram(hc, y = y, labels = names(y), 
                main = "My Simulated Data", 
                branchlength = 80)
