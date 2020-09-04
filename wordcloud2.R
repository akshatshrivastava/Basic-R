library(RColorBrewer) #color pallet
library(tm) #package text mining (tm)
library(wordcloud) 
library(DT) 
library(wordcloud2)

text<-readLines("D:/Rmlearning/CSV files/trump_inaug.txt",
                encoding ='UTF-8')
text[1:10]

#Removing the stopwords
text<-removeWords(text,stopwords("en"))
#Removing the punctuations
text<-removePunctuation(text)
#Removing the empty spaces
text<-text[-which(text=="")]
#Making all text lowercase
for (i in 1:length(text)) text[i]<-tolower(text[i])
#Choosing the words to be removed
text<-removeWords(text,c("the","there","this","'ve",
                         "it's","their","and",
                         "has","'have","are", 
                         "been",  "its", "will", "for"))
                        

doc<-Corpus(VectorSource(text))

tdm<-TermDocumentMatrix(doc)

dim(tdm)

m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)

d <- data.frame(word = names(v),freq=v)
datatable(d,class='compact',options = list(
  initComplete = JS(
    "function(settings, json) {",
    "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
    "}")
))


wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          random.order=FALSE,max.words=200,
          rot.per=0.35,colors=brewer.pal(40, name = "RdBu"))
