#3.1 2차원 어레이 생성

arr1 <- array(1:12, dim = c(3,4))
arr1

arr2 <- array(1:12, dim = c(3,4), dimnames = list(c("r1","r2","r3"),c("r1","r2","r3","r4")))
arr2              

mat1 <- matrix(1:12, nrow = 3)
mat1

mat2 <- matrix(1:12, nrow = 3, dimnames = list(c("r1","r2","r3"),c("r1","r2","r3","r4")))
mat2

# 3차원 어레이 생성

arr3 <- array(1:12, dim = c(2,2,3)) #x,y,z
arr3

# 4. list

a <- list(name = "길동", age = 30, job = "영업") # 키 밸류 구조
a # $name [1] "길동" $ age  [1] 30 $job [1] "영업" 처럼 list 가 표현된다

b <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3,5.9))
b 

c <- unlist(a) #벡터로 바꿀 것이다
c
str(C)
class(c)



d <- c("길동",30,"영업")
names(d) <- c('name','age','job') #즉 위의 unlist 와 같다 
d


df <- data.frame(name = "길동", age = 30, job = "영업") 
df
str(df)

df1 <- data.frame(name = "길동", age = 30, job = "영업", stringsAsFactors = FALSE) 
df1

iris_df <- iris

#컬럼명 바꾸기
names(df) <- c('Names','Ages','Job')
names(df)[1] <- 'namessss'
df

#adv-r.had.co.nz/Data-structures.html''

#벨터는 1차원 어레이, 매트릭스는 2차원 어레이 , 어레이는 n차원을 가질 수 있는 자료구조
# 벡터 매트릭스, 어레이는 동일한 데이터 타ㅣㅇㅂ만을 가진다.
## 리스트는 key/value 형식의 자료구조이며 수치 문자열형 데이터 타입을 혼용할 수 있다.
# 데이터 프레임은 엑셀에서 다루는 일반 테이블 구조와 같으며, 수치 문자열 데ㅣ터 타입을 혼용할 수 있다.

mat <- matrix(1:9, nrow = 3, dimnames = list(c("a1","a2","a3"),c("b1","b2","b3")))
mat

#방안1
mat[2,2]
#방안2 : 모든 행과 열에 이름을 붙인 경우
mat["a2","b2"]

#모든 행과 2,3열
#방안1
mat[1:3,2:3]
#방안2
mat[1:3,-1]
#방안3
mat[,-1] #mat[,] 전체가 보임

#방안4
mat[c("a1","a2","a3"),c("b1","b2")]

#2,3행과 1,2열의 인덱싱
mat[-1,-1]
mat[2:3,2:3]
mat[c("a2","a3"),c("b1","b2")]

arr <- array(1:12, dim = c(2,2,3))
arr

#첫번째 매트릭스의 모든 행에 대하여 2열 데이터를 인덱싱하라
arr[,2,1]
#세번째 매트릭스의 1행1열 데이터 인덱싱
arr[1,1,3]
#모든 매트릭스의 2행 2열데이터
arr[2,2,]

li <-list(name = c("길동","관순"),
          age = c(30,40),
          job = c("영업","기술"))
li

li$name[1]
li[[2]] +1


df <- data.frame(name = "길동", age = 30, job = "영업")
df[1,]
df[1,c("name","age","job")]

df[1]


#데이터 다루기 기본함수
#우리가 다루는 데이터의 대부분은 ㄷ이터프레임 형식으로 되어 있다. 대다수의 데이터가 수치, 문자열, 팩터의 자료형을 혼합하여 가지고 있기 때문이다. 따라서 데이터프레임을 예로 들어 데이터를 다루기 위한 구체적인 기능들을 알아보자
#행또는 열을 추가할 때 : rbind, cbind

help(cbind)

df

#사람을 추가
new_mem <-data.frame(name = c("흥민","지성","찬호"),
                     age = c(34,35,45),
                     job = c("축구선수","축구선수","야구선수수"))
df <- rbind(df,new_mem)                     
df

new_nat <- data.frame(nationality = c("한구","한국","한국","한국"))
df <- cbind(df, new_nat)
df

df$city <- c("한양","서울","토튼행","서울")
df

df$surname <- c("홍","손","박","박박")
df$city <- c("hasd","asd","qwe","zxc")
df
df$age[1] <- 34
df

df$nationality <-"chosun"
df
df$nationality[2:4]<- "korea"
df$nationality[3] <- "minsoo"

#원래 해얗는 방법 -> 내가 df$nationality 전체를바꿧기 때문에 korea로 바꿀수 있엇음 원래는 Factor 이기 때문에 바꿀 수 없음
df$nationality <- as.character(df$nationality)
str(str)
df$nationality[1] <- "Chosun"
## 이와 같은 방법으로 바꿔야한다. 그 후에 factor로 관리하고싶으면 as.factor를 통해 다시 factor로 바꿀 수 있다.
