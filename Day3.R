install.packages("multilinguer")
library(multilinguer)
install.packages(c('stringr','hash','tau','sejong','RSQLite','devtools'), type = "binary")
install.packages("remotes")

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", force =TRUE,
                        INSTALL_opts = c("--multiarch"))

library(KoNLP)

#print | cat
#print 변수의 값만 출력가능.하나의 변수만 출력
#cat 텍스트를 삽입해서 출력가능. 여러변수 출력가능

print_test <- c(1,5,7)
print_test1 <- c(2,4,6)
print(print_test)
print(print_test, print_test1)

cat(print_test, print_test1)
cat("첫번째는 홀수=", print_test, "두번째는 짝수=",print_test1)

#if문

x <- 10
y <- 5
z <- x * y
z

if(x*y >40){
  cat("xy의 갑은 40이상입니다.\n")
  cat("x * y =", z ,'\n')
  print(z)
  }
  

#1-3 which()
 #subsetting
#벡ㅌ터 객체를 대상으로 특정데이터를 검색하는데 사용
#조건식을 만족하는 경우 벡터 원소의 인덱스를 반환
#뎅터 프레임에서 사용


#데이터프레임 생성
no <- c(1:6)
name <- c(1,2,3,4,5,6)
score <- c(85,45,85,45,65,24)
exam <- data.frame(학번 = no, 이름 = name, 점수 = score)
exam

exam[4,]

exam$이름 ==3
exam[exam$이름  == "3"]


subset(exam, 이름 =='3')

#반복문 for()
i <- c(1:10)
i 
d<- c()
for(n in i){
  print(n)
  d[n] <- n*2 #d[1] = 2, ... d[10] = 20
}

for(n in 1:30){
  if(n%%2 == 0){print(n)}
}


score <- c(85,95,98)
name <- c("홍길동","이순신","김좌진진")

for(n in 1:3){

  cat(name[n], "->", score[n],'\n')
  
}

#while문

j <- 1
while(j<5){
  print("asd")
  j <- j+1
}
c <- 10
while(c>0){
  cat("남은 커피는",c,"잔입니다.\n")
  c <- c - 1
}
print("커피없어")
print("판매 종료")


for(n in 1:9){
  cat("**",n,"단 **\n")
  for(i in 1:9){
    cat(n,"*",i,"=",n*i,"\n")
  }
}

#사용자 정의 함수 만들기
#function(){}

gugu_func <- function(i){
  gg_l <- 1:9
  cat("** ", i, "단 **\n")
  for (j in 1:length(gg_l)){
    val = i * j
    cat(i , "*", j, "=", val, "\n")
  }
}

library(rJava)
library(KoNLP)

seoul_data <- readLines(
  con = "C:\\R-stu\\R_study\\seoul.txt",
  encoding = 'UTF-8')
)
seoul_data

#명사 추출 -->KoNLP 패키지 이용
sdata <- sapply(seoul_data, KoNLP::extractNoun,
                USE.NAMES = FALSE)
sdata
?sapply
sdata3
sdata2 <- unlist(sdata)
?gsub
#불용어 제거 필요없는 언어를 제거한다.
sdata3 <- gsub("서울시","",sdata2)
sdata3 <- gsub("박원순","",sdata3)
sdata3 <- gsub("시장+","",sdata3)
sdata3 <- gsub("드","",sdata3)
sdata3 <- gsub("실","",sdata3)
sdata3 <- gsub("는","",sdata3)

sdata4 <- read.table("seoul_new.txt")

write(sdata3, 'seoul_new.txt')

sort(table(sdata4))

wdcout <- head(sort(table(sdata4),decreasong = T),30)
install.packages(c('RColorBrewer','wordcloud'))
library(RColorBrewer)
library(wordcloud)


palette <- brewer.pal(9,"Set1")
wordcloud(names(wdcout),freq = wdcout, scale = c(3,0,5),
          rot.per = 0.25, min.freq=1,
          random.order= F, random.color = T, colors = palette)

.libPaths()
p
buildDictionary(ext_dic = c("woorimalsam",'sejong'),replace_usr_dic = F)

?buildDictionary
GDP_rank = read.csv(file = 'http://databank.worldbank.org/data/download/GDP_PPP.csv',
                    encoding = 'UTF-8')
head(GDP_rank, 20)

summary(GDP_rank)
library(ggplot2)

install.packages("stringr")
library(stringr)
GDP_rank$X.3 <- gsub(',', "", GDP_rank$X.3)
GDP_rank$X.3 <- as.integer(GDP_rank$X.3)
GDP_rank$X.3 <- as.integer(GDP_rank$X.3/1000)
GDP_rank
str(GDP_rank)
barplot(GDP_rank$X.3[6:26], names.arg = GDP_rank$X.2[6:26], 
        col=rainbow(21), xlab ='Nations', ylab='unit($Billion)',
        ylim =  c(0,25000),
        main = '2018년 국가별 GDP 순위(상위 20개국)')

