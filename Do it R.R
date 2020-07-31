install.packages("ggplot2")
library(ggplot2)

x <- c("a","a","c","d","e")

qplot(x)

mpg 
head(mpg)

qplot(data = mpg, x = cty)

qplot(data = mpg, x = drv, y = hwy, geom = "line", colour = drv)

english <- c(90,80,60,70)
names(english) <- c('a','b','c','d')
english

math <- c(50,60,100,20)
names(math) <- c('c','b','a','d')
math
df_midterm <- data.frame(english, math)


df_midterm


fruit <- data.frame(제품 = c("사과","딸기","수박"),
                      가격=c (1800,1500,3000),
                      판매량 = c(24,38,13))
fruit

mean(fruit.가격)
