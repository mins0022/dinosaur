#ctrl+ shif + c

# + install.packages() 이런 패키지를 설치
#  + installed.packages() 설치된 패키지 확인
# + data()
# + str(), class(), mode()
# + summary
# + min() max() mean() median() sum()\
# + table()

data()

iris

iris_df <- iris

#테이블) 사용예
table(iris_df$Species)

summary(iris_df)

View(iris_df)

#<방법 1 >
vec <- c(1,2,3,4,5)
vec 
View(vec)
vec[1] # 인덱스를 가져옴 / R에서는 index의 시작이 0 이 아닌 1부터 시작한다.
vec[c(1,4)]#-> vec의 1, 4번째 것을 보여줌 여러가지를 한번에 보여줄 때는 c로 묶어서 인덱스를 호출한다.
vec[2,5] # 다음과 같이 indexing 할 수 없음 


vec1 <- 1:5
vec1

str(vec1) #int[1:5] -> 가장 많이씀 데이터의 구조에 대한 것을 볼 수 있음
class(vec1) # 데이터 형태로 써있다
mode(vec1) #데이터 타입을 보여줌


?seq
vec2 <- seq(1,5,1) #seq(from, to, by) from부터 to까지 by만큼 증가 즉 seq(from = 1, to = 5 , by = 1)
vec2

vec2 <- vec2 + 1
seq(10,50,5)

vec3 <- "1" # "로 감싸게 되면 바로 문자열로 들어가게 된다 ' 도 동일
vec3
vec3 <- vec3 + 1 # 에러 발생 문자 + 숫자
vec3 <- vec3 + "2" # 에러발생 이항연산자에 수치가 아닌 인수입니다. 즉 데이터의 변경은 아예 업데이트 해야하는 듯

vec4 <- "홍길동"
vec4

vec5 <- c("홍길동","유관순")
vec5

vec6 <- c(1, "홍길동") #R의 특성상 에러를 일으키지 않고 1 을 문자열로 치환하여 저장한다.
vec6[1]<-"유관순"


a <- 1:100
mean(a)



Sys.Date() #"2020-07-30"
Sys.time() #"2020-07-30 15:33:40 KST"
date()# "Thu Jul 30 15:33:56 2020"

str('2018/6/16')
str(as.Date('2018/6/16'))
aaa <- as.Date('2018/6/16')
aaa-1
as.Date('18/6/16','%y/%m/%d')

dt <- c('1-5-17','18-7-20') #미국식데이터 처럼 현제 이런식으로 저장이 되어있다. 한국식으로 바꾼다면..
dt1 <- as.Date(dt,'%d-%m-%y') # as.Date를 통해 현재 날짜인것을 알고 format을 한다.
dt1

x <- c(1,3,5,7)
y <- c(3,5)
union(x,y) #합집합
intersect(x,y)#교집합
setdiff(x,y)#차집합

english <- c(55,80,75,100)

names(english) <- c('a','b','c','d')
english
english['a']

num <- 1:99
num
length(num)


num2 <- num[c(1:10, 91:100,16:25)]
num2
length(num2)


num[11:(length(num)/2)]
num[-c(91:100)] #91-100까지 빼고 호출!


1 %in% c(1,3,5) #1이 1,3,5안에 있는가
6 %in% c(1,3,5)


amt <- matrix(1:9, ncol = 3 )
amt  
mat1 <- matrix(1:9, ncol = 3, byrow = TRUE)
mat1

mat2 <- matrix(1:9, nrow = 3, dimnames = list(c("a1","a2","a3"),c("b1","b2","b3")))
mat2

#이름붙이기
#1. dimnames(mat) <-  list(c('a1','a2','a3'),c('c1','c2','c3'))
#2. colnames(mat) <- c('a1','a2','a3')
#   rownames(mat) <- c('c1','c2','c3')

rep(c("a","b","c"), times = 3) #rep 반복 을 times만큼해라라
?rep
mat3 <- matrix(rep(c("a","b","c"), each = 3), ncol = 3)
mat3               

mat4 <- matrix(rep(c("a","b","c"), times = 4), ncol = 6)
mat4

mat5 <- matrix(1:6, ncol=2)
t(mat5)
mat5

dim(mat5) #n by n 행렬
nrow(mat5)#행의 개수
ncol(mat5)#열의 개수

?apply
m <- matrix(1:9, ncol=3, byrow = TRUE)
m

apply(m,1,max) #행별 최대값
apply(m,2,mean) #열별 평균값
apply(m,2,min) #열별 최소값
