# Heatmaps
install.packages(c("ggplot2", "ggmap"))
library(ggmap)
library(ggplot2)
data <- read.csv(file.choose(), sep = ";")
View(data)

map <- get_map(location = "tartu", maptype = "satellite", zoom=12)

ggmap(map, extent = "device") + geom_point(aes(x = lon, y = lat), colour = "red", 
                                                 alpha = 0.1, size = 2, data = data)


# Word Cloud : Martin Luther King
install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer", "RCurl", "XML"))
library(wordcloud)
library(tm)
source('http://www.sthda.com/upload/rquery_wordcloud.r')
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
res<-rquery.wordcloud(filePath, type ="file", lang = "english")
res<-rquery.wordcloud(filePath, type ="file", lang = "english",
                      min.freq = 1,  max.words = 200)


df = read.csv(file.choose())

names(df)
