library(ggplot2)
t <- seq(0, 2*pi, length.out = 50) # 50 data points from 0 up to 2*pi (angles)
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y) # data set of angles, sin and cos


# Make a scatter plot of points in a circle
p <- ggplot(df, aes(x, y))+geom_point()+theme_void()
print(p)

x1 <- t * x
y1 <- t * y
df1 <- data.frame(t, x1, y1)
p1 <- ggplot(df1, aes(x1, y1))+ geom_point()+theme_void()
print(p1) 


# Defining the number of points
points <- 500

# Defining the Golden Angle
angle <- pi * (3 - sqrt(5))

# remake the scatter plot again
# t <- seq(1*angle, 500*angle, length.out = 500) # t <- (1:points) * angle
t <- (1:points) * angle
x <- sin(t)
y <-cos(t)
df <- data.frame(t, x, y)
p2 <- ggplot(df, aes(x*t, y*t))+ geom_point()+theme_void()
print(p2) 

#############################################
p2 <- ggplot(df, aes(x*t, y*t))
p2 + geom_point(mapping = aes(size = t), alpha = 0.5, shape=17, color = "yellow") +
  theme(panel.background = element_rect(fill = "white", colour = "darkmagenta"),
        title =  element_blank(), axis.ticks =  element_blank(),
        axis.text =  element_blank(), panel.grid =element_blank(),
        legend.position = "none")
####################################################

p <- ggplot(df, aes(x*t, y*t))

p + geom_point(alpha = 0.5, size = 8, color = "darkgreen") + 
  theme(panel.background = element_rect(fill = "white", 
                                        colour = "white"), 
        title =  element_blank(), 
        axis.ticks =  element_blank(), 
        axis.text =  element_blank(), 
        panel.grid =element_blank())

p + geom_point(mapping = aes(size = t), alpha = 0.5, shape=8, 
               color = "black") +
  theme(panel.background = element_rect(fill = "white", 
                                        colour = "white"),
        title =  element_blank(), axis.ticks =  element_blank(),
        axis.text =  element_blank(), panel.grid =element_blank(),
        legend.position = "none")

library(spatstat)
W <- square(10)
plot(W)
x <- square(c(-1,1))

