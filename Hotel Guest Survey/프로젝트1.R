setwd("C:/Work")
getwd()

install.packages("ggmap")
install.packages("raster")
install.packages('maptools')
install.packages('rgeos') 
install.packages('rgdal') 
library(ggmap)
library(ggplot2)
library(raster)
library(maptools)
library(rgeos)
library(rgdal)

map <- get_map(location='south korea', zoom=7, maptype='roadmap', color = "bw")

a1 <- read.csv("C:/Users/User/Downloads/상가업소정보+(2017년+3월)/상가업소_201703_01(시도).csv", header=T, as.is=T)
b1 <- read.csv("C:/Users/User/Downloads/상가업소정보+(2017년+3월)/상가업소_201703_02(시도).csv", header=T, as.is=T)
c1 <- read.csv("C:/Users/User/Downloads/상가업소정보+(2017년+3월)/상가업소_201703_03(시도).csv", header=T, as.is=T)
d1 <- read.csv("C:/Users/User/Downloads/상가업소정보+(2017년+3월)/상가업소_201703_04(시도).csv", header=T, as.is=T)

e1 <- merge(x=a1,y=b1,all=T)
f1 <- merge(x=e1,y=c1,all=T)
g1 <- merge(x=f1,y=d1,all=T)

korea1 <- shapefile('2013_si_do.shp')

korea1 <- fortify(korea1, region='code')
head(korea1)

g1_id <- data.frame(table(g1$id))
colnames(g1_id) <- c("id","상가업소수")
g1_kor_id <- merge(korea1, g1_id, by='id')
g1_kor_id

install.packages('viridis')
library(viridis)

kormap <- ggmap(map) + geom_polygon(data=g1_kor_id, aes(x=long, y=lat, group=group, fill=상가업소수), alpha=.75) + scale_fill_viridis(direction=-1) + theme_void()
kormap + geom_polygon(data=korea1, aes(x=long, y= lat, group=group), fill=NA , color='black')
