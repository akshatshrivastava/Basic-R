#R.MLEARNING CODE############################
#R.MLEARNING CODE############################
#R.MLEARNING CODE############################
#R.MLEARNING CODE############################

#finding normal and sorting 
r1<-sort(rnorm(50, sd=3, mean=2))
print(r1)
#extracting 10 number from the list
r1[10]

means <- c()
for(i in 1:1000){
  n <- sort(rnorm(50, sd=3, mean=2))
  y<-n[10]
  means[i] <- mean(y)
  }
mean(means)

#now as an exercise, do the variance loop by yourself
#Only a change in one line is required......:-)
#If in doubt, feel free to ask me.....

#R.MLEARNING CODE############################
#R.MLEARNING CODE############################
#R.MLEARNING CODE############################
#R.MLEARNING CODE############################




