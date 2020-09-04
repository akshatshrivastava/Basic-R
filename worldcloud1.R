library(dplyr)
library(stringr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer) #color pallet
library(tm) #package text mining (tm)
library(DT) 

text<-readLines("D:/Rmlearning/CSV files/trump_inaug.txt",
                encoding ='UTF-8')
text[1:10]

FreqCategory <- function(value) {
  strCategory <- ifelse(value <=5,   "      5",
                  ifelse(value <=10,     "     10",
                  ifelse(value <=20,     "     20",
                  ifelse(value <=50,     "     50",
                  ifelse(value <=100,    "    100",
                  ifelse(value <=500,    "    500",
                  ifelse(value <=1000,   "  1,000",
                   ">1,000")))))))
  strCategory
}

vcsUNPrfLines<-readLines("D:/Rmlearning/CSV files/trump_inaug.txt",
                encoding ='UTF-8')

head(vcsUNPrfLines)

intLineCount <- length(vcsUNPrfLines)
intLineCount

# split
lstUNPrfLines <- str_split(vcsUNPrfLines," ")
# words per line
vciUNPrfWperL <- unlist(lapply(lstUNPrfLines, length))
# print average words per line
mean(vciUNPrfWperL)

# unlist to get vector of words
vcsUNPrfWords <- unlist(lstUNPrfLines)
# total word count = length of vector
intWordCount <- length(vcsUNPrfWords)
# print
intWordCount

head(vcsUNPrfWords,100)

# lower case
vcsUNPrfWords <- str_to_lower(vcsUNPrfWords)
# remove numbers
vcsUNPrfWords <- str_replace_all(vcsUNPrfWords, pattern="[[:digit:]]", "")
# remove punctuation
vcsUNPrfWords <- str_replace_all(vcsUNPrfWords, pattern="[[:punct:]]", "")
# remove white spaces
vcsUNPrfWords <- str_replace_all(vcsUNPrfWords, pattern="[[:space:]]", "")
# remove special chars
vcsUNPrfWords <- str_replace_all(vcsUNPrfWords, pattern="[~@#$%&-_=<>]", "")
# remove empty vectors
vcsUNPrfWords <- vcsUNPrfWords[vcsUNPrfWords != ""]
# hack & remove $
vcsUNPrfWords <- str_replace_all(vcsUNPrfWords, pattern="$", "")

#remove some words
vcsUNPrfWords <-removeWords(text,c("the","there","this",
                                   "'ve","it's","their","and"))
# head
head(vcsUNPrfWords,100)

dfrUNPrfWords <- data.frame(vcsUNPrfWords)
colnames(dfrUNPrfWords) <- c("Words")
dfrUNPrfWords$Words <- as.character(dfrUNPrfWords$Words)
# normal word count
head(dfrUNPrfWords,10)

dfrUNPrfFreq <- dfrUNPrfWords %>% 
  group_by(Words) %>% 
  summarise(Freq=n()) %>% 
  arrange(desc(Freq))
head(dfrUNPrfFreq)

wordcloud(dfrUNPrfFreq$Words[1:100], dfrUNPrfFreq$Freq[1:100], 
          random.order=F, max.words=100, 
          colors=brewer.pal(8, "Dark2"))
