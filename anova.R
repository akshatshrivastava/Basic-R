a1 <- c(6,8, 4,5, 3,4)
a2 <- c(8,12,9,11,6,8)
a3 <- c(13,9,11,8,7,12)

df <-data.frame(cbind(a1,a2,a3))
df

stacked_df <-stack(df)
stacked_df

anova_d <-aov(values ~ ind, data = stacked_df)
summary(anova_d)


