

# DataPreprocessing(데이터 전처리)
# 데이터를 불러온 후 입력된 자료에 오류가 없는지 확인하고 특이한 형태의 데이터를 개략적으로 분석하는 과정이 필요하다. 이러한 분석과정을 통해서 데이터를 정제하는 과정을 데이터 전처리라고 한다.
#EDA(데이터의 탐색 과정)
#1.탐색적 데이터 조회
#1.1 데이터 셋 보기
# 데이터 가져오기
dataset <- read.csv("C:\\R-stu\\R_study\\dataset.csv")
dataset
summary(dataset)
#resident, gender, job, survey -> 숫자의 의미는 없고 무언가를 가리키는 명목형변수
#age, price -> 연속형 변수
table(is.na(dataset))#결측치를 어떻게 다룰 것이냐가 고민
attributes(dataset) # 특성 한번에 보기
names(dataset)
library(ggplot2)
#두 변수의 관계를 확인해보기
x <- dataset$gender
y <- dataset$price
length(y)
plot(x,y)

#산점도 형태로 변수 조회
plot(dataset$price)

#[][[형식으로 특정 변수 조회
dataset["gender"]
#[index]형식으로 변수 조회
dataset[2]

#결측치 제거
sum(dataset$price, na.rm=T) #합을 구할 때, na인 값 자체를 빼고 진행
mean(dataset$price, na.re = T) # 평균시 na가 있는 것 자체를 빼고 평균값

dim(dataset)

dataset4 <- na.omit(dataset) #데이터셋 중 na가 하나라도 있는 행은 다 지우고 보여줌
dataset4 #따라서 각 열별로 na.omit을 확인하고 전체 데이터셋을 결측치 처리를 해야한다.
?na.omit

dataset4 <- na.omit(dataset)
dim(dataset4)

#결측치를 0으로 대체하여 처리하기
x <- dataset$price
x[1:30]
dataset$price2 <- ifelse(!is.na(x),x,0) #ifelse(is.na(x),0,x)
dataset$price2[1:30]

#결측치를 평균데이터로 처리하기
x <- dataset$price # price vector 생성
x[1:30]
dataset$price3 = ifelse(!is.na(x),x,round(mean(x,na.rm=TRUE),2))
dataset$price3[1:30]
a <- dataset[c('price','price2','price3')]
a
subset(a,is.na(price))

#이상치(outlier) 처리

#범주형 변수의 이상치 확인
table(dataset$gender) #gender는 1과 2만 있어야 하지만 0,5가 포함되어 있다.따라서 제거해주어야 한다.
pie(table(dataset$gender))  #파이차트

#subset() 함수를 이용한 데이터 정제하기
dataset <- subset(dataset, gender ==1 | gender ==2)
#length(dataset$gender) #gender변수 데이터 정제제
length(dataset$gender)
pie(table(dataset$gender))
pie(table(dataset$gender), col = c('red','blue')) #gender의 처음값을 red 로 두번째를 blue 로 입혀서 pie 차트를 만든다.

#price 값을 2~8까지만 있는 것을 추출해보기
dataset2 <- subset(dataset, price >=2 & price <=8)
length(dataset2$price)
pie(table(dataset2$price))
dataset2
stem(dataset2$price)
#age변수에서 NA발견
summary(dataset2$age)
length(dataset2$age)

dataset3 <- subset(dataset2, age >= 20 & age <=69)

#na.omit 사용
data_na <- na.omit(dataset2$age)
length(data_na)
length(dataset3$age)
#boxplot(dataset$age)
#아래 데이터 프레임의 test변수의 NA를 평균으로 대체하기
tt <- data.frame(test = c(1,3,8,4,3,4,NA,9))
mean(tt$test,na.rm = T)
mean(na.omit(tt$test))
x <- tt$test
ifelse(!is.na(x),x,round(mean(x,na.rm=T),2))


#코딩변경
#가독성(코딩변경)
#dataset2에 resudent 변수의 1 -> 1.서울특별시 2.인천광역시 3. 대전광역시 4.대구광역시. 5.시구군으로 표기하는 resident2변수를 생성하기
a <- dataset2$resident
aa <- ifelse(is.na(a),"fail",
             ifelse(a==1,"서울특별시",
                    ifelse(a==2,"인천광역시",
                           ifelse(a==3,"대전광역시",
                                  ifelse(a==4,"대구광역시","시구군")))))
aa
dataset2$resident2 <- aa
dataset2

# dataset2$resident2[dataset2$resident == 1] <-'1.서울특별시'
# dataset2$resident2[dataset2$resident == 1] <-'2.인천광역시'
# dataset2$resident2[dataset2$resident == 1] <-'3.대전광역시'
# dataset2$resident2[dataset2$resident == 1] <-'4.대구광역시'
# dataset2$resident2[dataset2$resident == 1] <-'5.시구군'
# datset2[c("resident","resident2")] #2개만 지정

dataset2$job2[dataset2$job == 1] <- '공무원'
dataset2$job2[dataset2$job == 2] <- '회사원'
dataset2$job2[dataset2$job == 3] <- '개인사업가'

#4.2척도변경을 위한 코딩 변경
#나이 변수를 청년층 중년층 장년층으로 코딩하기

dataset2$age2[dataset2$age <= 30] <- '청년층'
dataset2$age2[dataset2$age > 30 & dataset2$age <= 55] <- '중년층'
dataset2$age2[dataset2$age >55] <- '장년층'
head(dataset2)
dataset2$survey[dataset2$survey == 5] <- 1
dataset2$survey[dataset2$survey == 4] <- 2
dataset2$survey[dataset2$survey == 1] <- 5
dataset2$survey[dataset2$survey == 2] <- 4

dataset2$survey

library(ggplot2)
library(dplyr)
exam <- read.csv('C:\\R-stu\\R_study\\Doit_R\\Data\\csv_exam.csv')

mpg
summary(mpg)
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())


mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty + hwy)) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

test1
