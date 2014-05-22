R NLP - Explore
===============
  
This repository contains files, with demo setup to explore text sentiment analysis performed in R.

##Setup 

+ Extract tweet statuses from @otv_chel

  Out: `data\tweets.csv`
  
  source file - `acquire_tweets.R`
  
+ Translate tweets
  
  In: `data\tweets.csv`

  Out: `data\tweets-en.csv`
  
  source files (python) - `\translate`
  
+ Clean tweets
  
  In: `data\tweets-en.csv`

  Out: `data\clean-tweets-en.csv`
  
  source file - `clean_tweets.R`
    
+ Acquire sentiments (datum service)

  In: `clean-tweets-en.csv`
  
  Out: `data\sent-tweets-en.txt`
  
  source file - `acquire_sentiment.R`
  
+ Build worlds cloud

  In: `data\sent-tweets-en.txt`
  
  source file - `make_cloud.R`
  
###Description

This test show that R doesn't fit well for NPL purposes since :

  + No stemming, no synonims
  
  + Datum service often get wrong labeling due to shortage of text size (twitter limitation)
  
  + Words cloud build, require large memory size > 1.6 GB
  
  
[Next try](http://www.alchemyapi.com/products/demo/alchemylanguage/)

  

  
  
  



