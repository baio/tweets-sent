#Acquire (load tweets) here

library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)
library(tm)
library(wordcloud)

Sys.setlocale(,"russian")

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
apiKey <- "dJAWHOS945RGlRynLZjF4wWT8"
apiSecret <- "5tU68zS9MMjLWdPEs7EFKqU7IS7DZuzhRPvywc5ek7wh1pYU8k"

twitCred <- OAuthFactory$new(consumerKey=apiKey,consumerSecret=apiSecret,requestURL=reqURL,accessURL=accessURL,authURL=authURL)
#twitCred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
twitCred$handshake()

registerTwitterOAuth(twitCred)
#registerTwitterOAuth(twitCred)


print("Getting tweets...")
# get some tweets
tweets = userTimeline('otv_chel', n=5000)

# get text 
tweet_txt = sapply(tweets, function(x) x$getText())
tweet_txt_df = data.frame(text=tweet_txt)
write.csv(tweet_txt_df, file="data/tweets.csv")
