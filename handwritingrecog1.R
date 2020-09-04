library(jpeg)
myurl <- "https://raw.githubusercontent.com/RRighart/Digits/master/HandwrittenDigits.JPG" 
z <- tempfile()
download.file(myurl,z,mode="wb")
img <- readJPEG(z)
file.remove(z)

par(mfrow=c(1,1),
    oma = c(0.5,0.5,0.5,0.5) + 0.1,
    mar = c(0,0,0,0) + 0.1)
image(t(apply(img[c(1:dim(img)[1]), 
                  c(1:dim(img)[2]), 1], 2, rev)), 
      col=grey.colors(255), axes=F, asp=1)
mtext("Whole image of handwritten digits", cex=0.6, col="red")

library(EBImage)
ximg<-img[c(1:dim(img)[1]), c(1:dim(img)[2]), 1]
nhsq=42
pix=28
nimg <- resize(ximg, h = nhsq*pix)
dim(nimg)

nimg<-nimg[1:1568, ]
dim(nimg)

matsplitter<-function(M, r, c) {
  rg <- (row(M)-1)%/%r+1
  cg <- (col(M)-1)%/%c+1
  rci <- (rg-1)*max(cg) + cg
  N <- prod(dim(M))/r/c
  cv <- unlist(lapply(1:N, function(x) M[rci==x]))
  dim(cv)<-c(r,c,N)
  cv
} 

nimg<-nimg[c(1:dim(nimg)[1]), ]
dat<-matsplitter(nimg, 28, 28)
class(dat)

labels=rep(c(NA, rep(seq.int(0, 9, by=1),4), NA), 56)
table(labels)

ndat<-dat[,,which(!is.na(labels))]
nlabels<-labels[which(!is.na(labels))]

par(mfrow=c(2,5),
    oma = c(3,3,3,3) + 0.1,
    mar = c(0,0.1,0,0.1) + 0.1)
for(i in 1:10){
  image(t(apply(ndat[, ,i], 2, rev)), col=grey.colors(255), axes=F, asp=1);   mtext(nlabels[i], cex=0.8, col="red", side=3, line=-1)  
}


neg <- function(M,i){
  apply(M, 3, max)[i]-M[,,i]
}

mmat<-array(0,dim=dim(ndat))

for(i in 1:dim(ndat)[3]){
  mmat[,,i]<-neg(ndat,i)
}





















