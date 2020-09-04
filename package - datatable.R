library(data.table)

system.time({m_df <- read.csv('D:/Rmlearning/CSV files/iris.csv')})

system.time({m_dt <- fread('D:/Rmlearning/CSV files/iris.csv')})

mtcars_dt <- as.data.table(mtcars)

# dataframe syntax
k=mtcars[mtcars$cyl == 6, ]
k1=mtcars[,mtcars$cyl == 6]
k2=mtcars

# datatable syntax
mtcars_dt[cyl==6 & gear==4, ]

mtcars_dt[, 1, with=F]

mtcars_dt[, mpg]

columns <- c('mpg', 'cyl', 'disp')

#elow generates error
mtcars_dt[, columns]

#This is correct
mtcars_dt[, columns, with=F]

#Renaming a columns
setnames(mtcars_dt, 'cyl', 'cylinder')
colnames(mtcars_dt)

mtcars_mpg<-data.table(mtcars$mpg)
setnames(mtcars_mpg, 'mpg')
mtcars_mpg[, mileage_type := ifelse(mpg > 20, 'high', 'low')]
mtcars_mpg

# Mean mileage by `cyl` 
mtcars_dt[, .(mean_mileage=mean(mpg)), by=cylinder]

mtcars_dt[, .(mean_mileage=mean(mpg)), by=.(cylinder, gear)]

mtcars_dt[, .(first_mileage=mpg[1]), by=cylinder]
mtcars_dt[, .(second_mileage=mpg[2]), by=cylinder]

# < returns the number of rows for each unique value of cyl>
mtcars_dt[, .N, by=cylinder]

mtcars_dt[, .I]
# <returns numbers from 1,2,3..>

mtcars_dt[cylinder==6, .I]






