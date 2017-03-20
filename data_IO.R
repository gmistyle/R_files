##讀取外部資料
setwd('data所在的資料夾路徑')
chem<-read.csv(file = '檔名.csv', header = T) # header: 要不要有標題欄位

##單純把結果存成txt檔
sink('路徑\\檔名.csv')
#想要計算的code(...)
sink()

##把結果存成csv檔_範例
r <- summary(IT$INV_95)
x<-c(r[1],r[2],r[3],r[4],r[5],r[6])
y<-data.frame(data = x)
write.csv(y, 'test.csv')
