install.packages("dplyr")
library(dplyr)

df_new <- data.frame(var1 = c(1,2,3),
                     var2 = c(2,3,2))
df_raw
df_new <- rename(df_new, v2 = var2)
df_new

df <- data.frame(var1 =c(4,3,8),
                 var2 =c(2,6,1))
df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1 + df$var2)/2
df
library(ggplot2)
mpg
mpg$total <- (mpg$cty + mpg$hwy)/2
mpg
mpg$total

head(mpg)
summary(mpg)
summary(mpg$total)
hist(mpg$total)

mpg_tf <- ifelse(mpg$total >= 20, "pass","fail")

qplot(mpg_tf)

mpg$grade <- ifelse(mpg$total >=30, "A",
                    ifelse(mpg$total >= 20, "B","C"))
table(mpg$grade) #현재 가지고 있는 것의 빈도수 통계
qplot(mpg$grade) # 빈도수 막대 그래프

midwest
class(midwest)
str(midwest)
midwest <- rename(midwest,total = poptotal)
library(dplyr)
midwest <- rename(midwest,asian = popasian)
midwest
midwest$asd <- midwest$asian / midwest$total
midwest
hist(midwest$asd)
mean(midwest$asd)
midwest$larsma <- ifelse(midwest$asd > mean(midwest$asd), "large","small")
midwest$larsma
table(midwest$larsma) #빈도표
qplot(midwest$larsma) #막대그래프





