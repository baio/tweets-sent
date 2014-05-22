#tweets_ru = read.csv("data/clean-tweets.txt",stringsAsFactors=FALSE)
tweets_en = read.csv("data/clean-tweets-en.txt",stringsAsFactors=FALSE)

tweet_num = nrow(tweets_en)

tweet_sent_df = data.frame(text=tweets_en, sentiment=rep("", tweet_num),stringsAsFactors=FALSE)

getSentiment <- function (text, key){
  
  text <- URLencode(text);
  
  #save all the spaces, then get rid of the weird characters that break the API, then convert back the URL-encoded spaces.
  text <- str_replace_all(text, "%20", " ");
  text <- str_replace_all(text, "%\\d\\d", "");
  text <- str_replace_all(text, " ", "%20");
  
  
  if (str_length(text) > 360){
    text <- substr(text, 0, 359);
  }
  ##########################################
  
  data <- getURL(paste("http://api.datumbox.com/1.0/TwitterSentimentAnalysis.json?api_key=", key, "&text=",text, sep=""))
  
  js <- fromJSON(data, asText=TRUE);
  
  # get mood probability
  sentiment = js$output$result
  
  ###################################
  
  
  return(list(sentiment=sentiment))
}

db_key = "bff473539d30721c74055e863b1b1532"

print("Getting sentiments...")
# apply function getSentiment

sentiment = rep(0, tweet_num)
for (i in 1:tweet_num)
{
  tmp = getSentiment(tweet_clean[i], db_key)
  
  tweet_sent_df$sentiment[i] = tmp$sentiment
  
  print(paste(i," of ", tweet_num))
}

write.csv(tweet_sent_df, file="data/tweets-sent-en.csv")

# delete rows with no sentiment
#tweet_df <- tweet_df[tweet_df$sentiment!="",]


#separate text by sentiment
#sents = levels(factor(tweet_df$sentiment))
#emos_label <- emos


# get the labels and percents

#labels <-  lapply(sents, function(x) paste(x,format(round((length((tweet_df[tweet_df$sentiment ==x,])$text)/length(tweet_df$sentiment)*100),2),nsmall=2),"%"))
