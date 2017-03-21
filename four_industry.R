rm(list=ls())
setwd('路徑')

chem<-read.csv(file = '化學工業.csv', header = T)
people<-read.csv(file = '民生工業.csv', header = T)
metal<-read.csv(file = '金屬機電工業.csv', header = T)
IT <- read.csv(file = '資訊電子工業.csv', header = T)

## t-test process
t_test <- function(input){
  x1 <- input$INV_95 ; x2 <- input$INV_100
  var_test <- var.test(x1, x2)
  if (var_test$p.value <= 0.5){
    t_mean <- t.test(x1, x2, var.equal = F)
  } 
  else {
    t_mean <- t.test(x1, x1, var.equal = T)
  }
  result <- list(var_test, t_mean)
  return(result)
}

##計算下降上升家數/比例 & 執行t-test
up_down <- function(input, max, col_name){
  up <- down <- 0
  for (i in 1:max){
    if(input$INV_95[i]<input$INV_100[i]) {
      up = up + 1
    }
    else {
      down = down + 1
    }
  }
  proportion <- up/max
  t <- t_test(input)
  x <- data.frame(c(max, up, down , proportion, t[[2]]$p.value))
  row.names(x) <- c('total', 'up', 'down', 'proportion', 'p-value')
  colnames(x) <- col_name
  return(x)
}

##執行
(a <- up_down(IT, 217, 'IT'))
(b <- up_down(people, 956, 'people'))
(c <- up_down(chem, 1170, 'chem'))
(d <- up_down(metal, 2555, 'metal'))
e <- list(a, b, c, d)#可以使用共同rowname一起寫入
write.table(e, 'test.csv', sep = ",", append = T)

