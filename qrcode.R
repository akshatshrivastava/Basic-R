install.packages("qrcode")


library(qrcode)

png("qrplot.png")

qrcode_gen("https://www.instagram.com/r.mlearning.com/")

getwd()


dev.off()