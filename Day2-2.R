#1 데이터 불러오기
# 자바 환경설정
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_251")
install.packages(c('rJava','xlsx'))


library(rJava)
library(xlsx)

#read.table(file = 경로명, sep ='컬럼구분자', header ="TRUE/ FALSE")
read.table(file ='C:\\R-stu\\rsource\\data\\student.txt', sep = "", header = F)

?read.table


a <- runif(10) # 난수 발생 함수
a
seque <- 1:10

a_df <- data.frame(num = a, sequence = seque)
a_df

order(a_df$num, decreasing = T)

b <- a_df[order(a_df$num, decreasing = T),]
b

student1 <-read.table(file = "C:\\R-stu\\rsource\\data\\student1.txt", header = T)
student2 <-read.table(file = "C:\\R-stu\\rsource\\data\\student2.txt", sep = ";", header = T)
student1
student2
student1_2 <- read.table(file = file.choose(), header = TRUE)


install.packages("tibble")
library(tibble)

iris_df <- iris
iris_df

iris_df1 <- as.tibble(iris)
iris_df1
?vignette
vignette('tibble')

student3 <- read.table(file= "./data/student3.txt", sep = " ", header= TRUE, na.strings = "-")
student3
student3[3,4]


student4 <- read.table(file= "./data/student4.txt", sep = ",", header= TRUE, na.strings = c("-","+","$"))
student4

library(ggplot2)
cty <- row.names(USArrests)
cty
Usa <- USArrests
Usa <- cbind(Usa, cty)
?order
qplot(data =USArrests,  x = reorder(cty), y = Murder/UrbanPop ) + geom_bar(stat = 'identity')
?qplot


Usa <- USArrests
Usa <- cbind(Usa, cty)



UsaMP <-Usa$Murder/Usa$UrbanPop
UsaMP
Usa <- cbind(Usa,UsaMP)
Usa
Usa1 <- order(Usa$UsaMP)
Usa1

ggplot(data = Usa1, aes(x=cty, y=mUsaMP)) + geom_col()



install.packages("dplyr")
library(dplyr)

Usa1 <- head(arrange(Usa,desc(UsaMP) ),7)
Usa1
qplot(Usa1, x = cty, y = UsaMP) + geom_bar(sta =  "identity")


ggplot(data = Usa1, aes(x=reorder(cty, -UsaMP), y=UsaMP, fill = rainbow(7))) + geom_col()
?ggplot
