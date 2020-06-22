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

ggmap(get_map(location='south korea', zoom=7))
map <- get_map(location='south korea', zoom=7, maptype='roadmap', color = "bw")

a <- read.csv("C:/Users/User/Desktop/R 프로젝트/상가업소_201703_01(시도).csv", header=T, as.is=T)
b <- read.csv("C:/Users/User/Desktop/R 프로젝트/상가업소_201703_02(시도).csv", header=T, as.is=T)
c <- read.csv("C:/Users/User/Desktop/R 프로젝트/상가업소_201703_03(시도).csv", header=T, as.is=T)
d <- read.csv("C:/Users/User/Desktop/R 프로젝트/상가업소_201703_04(시도).csv", header=T, as.is=T)

e <- merge(x=a,y=b,all=T)
f <- merge(x=e,y=c,all=T)
g <- merge(x=f,y=d,all=T)



korea <-  getData('GADM', country='kor', level=2)

ggplot() + geom_polygon(data=korea, aes(x=long, y= lat, group=group), fill='white', color='black')

korea <- shapefile('TL_SCCO_SIG.shp')

head(korea)

korea <- fortify(korea, region='SIG_CD')
head(korea)

g_id <- data.frame(table(g$id))
colnames(g_id) <- c("id","상가업소수")
g_kor_id <- merge(korea, g_id, by='id')
g_kor_id

p <- ggmap(map) + geom_polygon(data=g_kor_id, aes(x=long, y=lat, group=group, fill=상가업소수), alpha=.75) + scale_fill_viridis(direction=-1) + theme_void()
p + scale_fill_gradient(low='white', high='#004ea2')
p + scale_fill_gradient(low='white', high='#004ea2') + theme_void() + guides(fill=F)
p + scale_fill_gradientn(colours = heat.colors(10))
p + scale_fill_gradient(low='#98F5FF', high='#00008B')


ggmap(map) + geom_polygon(data=g_kor_id, aes(x=long, y=lat, group=group, fill=상가업소수), alpha=.75) + scale_fill_gradient(low='#98F5FF', high='#00008B') + theme_void() + guides(fill=F) 

install.packages('viridis')
library(viridis)
p + scale_fill_viridis(direction=-1) + theme_void() + guides(fill=F)
p + geom_polygon(data=korea, aes(x=long, y= lat, group=group), fill=NA , color='black')
kormap <- ggmap(map) + geom_polygon(data=g_kor_id, aes(x=long, y=lat, group=group, fill=상가업소수), alpha=.75) + scale_fill_viridis(direction=-1) + theme_void()
kormap + geom_polygon(data=korea, aes(x=long, y= lat, group=group), fill=NA , color='black')

#인천

inc <- korea[korea$id <= 28720 & korea$id >=28110, ]
ggplot() + geom_polygon(data=inc, aes(x=long, y=lat, group=group), fill='white', color='black')
g_inc_id <- merge(inc, g_id, by='id')
map2 <- get_map(location='incheon', zoom=11, maptype='roadmap', color = "bw")
incmap <- ggmap(map2) + geom_polygon(data=g_inc_id, aes(x=long, y=lat, group=group, fill=상가업소수), alpha = .75) + scale_fill_viridis(direction=-1) + theme_void()
incmap + geom_polygon(data=inc, aes(x=long, y=lat, group=group), fill = NA, color = 'black')
