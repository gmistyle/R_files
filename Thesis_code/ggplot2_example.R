# 圖形類別與各式資訊 
#https://blog.gtwang.org/r/ggplot2-tutorial-layer-by-layer-plotting/3/
#http://shujuren.org/article/44.html
#http://www.rpubs.com/lihaoyi/156592
#http://blog.csdn.net/u014801157/article/details/24372521
#圖例教學 http://blog.csdn.net/bone_ace/article/details/47284805
#圖標教學 http://blog.csdn.net/bone_ace/article/details/47427453
#字型教學 http://kanchengzxdfgcv.blogspot.tw/2016/11/r-ggplot.html
rm(list=ls())
##package
library(ggplot2)
library(xlsx)
library(extrafont)#font type package
#####################
#      對外投資     #
#####################
#both_FDI
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\對外投資篇')
d <- read.csv('both_FDI.csv')

ggplot(d, aes(x = year, y = data, fill = type))+ 
  geom_bar(stat = 'identity', position = 'fill', colour = 'black')+
  labs(x = '', y = '(百萬美元)')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')

#global_FDI
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\對外投資篇')
d <- read.csv('global_FDI.csv')

ggplot(d, aes(x = year, y = data, colour = 地區))+ 
  geom_line(size = 1.3)+
  geom_point()+
  labs(x = '', y = '(%)')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')

#manufacture_FDI
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\對外投資篇')
d <- read.csv('CH_FDI_type.csv')
ggplot(d, aes(x = year, y = data, fill = type))+ 
  geom_bar(stat = 'identity', position = 'stack', colour = 'black')+
  labs(x = '', y = '(百萬美元)')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')

#bundle_FDI
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\對外投資篇')
d <- read.csv('bundle_industry.csv')
ggplot(d, aes(x = year, y = data, fill = type))+ 
  geom_bar(stat = 'identity', position = 'fill', colour = 'black', width = 0.5)+
  labs(x = '', y = '')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')
  

#####################
#      國內投資     #
#####################
##GDP
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\國內投資篇')
d <- read.csv('GDP.csv')

ggplot(d, aes(x = year, y = YoY))+
  geom_point()+
  geom_line(group = '1')+
  labs(x = '', y = '', title = 'GDP growth rate(%)')+
  geom_hline(aes(yintercept=0), linetype="dashed")+
  geom_hline(aes(yintercept=0.04), linetype="dashed")+
  geom_hline(aes(yintercept=0.08), linetype="dashed")+
  scale_x_continuous(breaks=seq(1911, 2016, 2))

##Saving and Domestic Investment
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\國內投資篇')
d <- read.csv('overS.csv')

ggplot(d, aes(x = year, y = data, linetype = type))+ #colour or linetype
  geom_line(size = 1)+
  labs(x = '', y = '')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')+
  theme(legend.text = element_text(size = 14))

#####################
#      產業結構     #
#####################
#industry_inGDP
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\產業概況篇')
d <- read.csv('industry_inGDP.csv')

ggplot(d, aes(x = year, y = data, colour = 產業))+ 
  geom_line(size = 1.2)+
  labs(x = '', y = '(%)')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')

##Fixed Investment
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\產業概況篇')
d <- read.csv('FA_share_by_industry.csv')

ggplot(d, aes(x = year, y = data, colour = industry))+ 
  geom_line(size = 1.2)+
  labs(x = '', y = '(%)')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')

#manufacturing
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\產業概況篇')
d <- read.csv('manufacturing_net_inv_growth.csv')

ggplot(d, aes(x = year, y = amount2))+ 
  geom_line(size = 1)+
  labs(x = '', y = '(十億新台幣)')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')
#####################
#      研發支出     #
#####################
#RD
setwd('C:\\Users\\JIMMY\\Documents\\畢業論文\\data\\Gov_data\\製圖用資料表\\研發創新篇')
d1 <- read.csv('RD_inGDP.csv')
d2 <- read.csv('RD_inVA.csv')
d3 <- read.csv('basicRD_inRD.csv')
d4 <- read.csv('RD_EXP.csv')

ggplot(d1, aes(x = date, y = data, colour = 國別))+ 
  geom_line(size = 1.2)+
  geom_point()+
  labs(x = '', y = '(%)')

ggplot(d2, aes(x = date, y = data, colour = 國別))+ 
  geom_line(size = 1)+
  geom_point()+
  labs(x = '', y = '(%)')

ggplot(d3, aes(x = date, y = data, colour = 國別))+ 
  geom_line(size = 1)+
  geom_point()+
  labs(x = '', y = '(%)')

ggplot(d4, aes(x = year, y = data, colour = type))+
  geom_line(size = 1.3)+
  geom_point()+
  labs(x = '', y = '')+
  theme(legend.title = element_blank())+
  theme(legend.position = 'bottom')
