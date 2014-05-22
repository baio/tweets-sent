library(stringr)
library(tm)
library(wordcloud)

tweets_en = read.csv("data/clean-tweets-en.txt",stringsAsFactors=FALSE)

class(tweets_en[,1])

x <- unlist(strsplit(tweets_en[,1], split=" "))
class(x)

emos.docs = x

# remove stopwords
emo.docs = removeWords(x, stopwords("english"))
corpus = Corpus(VectorSource(emo.docs))
tdm = TermDocumentMatrix(corpus)
#tdm = as.matrix(tdm)


# comparison word cloud
comparison.cloud(tdm, colors = brewer.pal(1, "Dark2"),
                 scale = c(3,.5), random.order = FALSE, title.size = 1.5)