library(ggplot2)
library(gganimate)

# Make 2 basic states and concatenate them:
a <- data.frame(Subjects=c("Maths","Chemistry","Physics"), 
                Marks=c(57,90,95), 
                frame=rep('a',3))
b <- data.frame(Subjects=c("Maths","Chemistry","Physics"), 
                Marks=c(95,80,75), 
                frame=rep('b',3))

data <- rbind(a,b)  
head(data)

# Basic barplot:
ggplot(a, aes(x=Subjects, y=Marks, fill=Subjects)) + 
  geom_bar(stat='identity')

# Make a ggplot, but add frame=year: one image per year
ggplot(data, aes(x=Subjects, y=Marks, fill=Subjects)) + 
  geom_bar(stat='identity') +
  theme_bw() +
  # gganimate specific bits:
  transition_states(
    frame,
    transition_length = 1,
    state_length = 1
  ) +
  ease_aes('sine-in-out')

# Save at gif:
anim_save("288-animated-barplot-transition.gif")
