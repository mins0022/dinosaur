# 1. 다음 조건에 맞게 client 데이터프레임을 생성하고 데이터를 처리해보세요
# 
# + name : '유관순','홍길동','이순신','신사임당'
# 
# + gender : 'F','M','M','F'
# 
# + price : 50,65,45,75
# 
# + 조건1 : 3개의 벡터 객체를 이용하여 client 데이터 프레임 생성
# 
# + 조건2 : price 변수의 값이 65만원 이상이면, 문자열 'Best', 65만원 미만이면 'Normal'을 변수 result 컬럼에 추가
# 
# + result 변수를 대상으로 빈도수 구하기

clint <- data.frame(name = c('유관순','홍길동','이순신','신사임당'),
                    gender = c('F','M','M','F'),
                    price = c(50,65,45,75))
for(i in 1:length(clint$name)){
  ifelse(clint$price[i] >= 65, clint$result[i] <- "Best",clint$result[i] <- "Normal")
  
}
clint
table(clint$result)

# 2. 다음 벡터 EMP는 '입사년도이름급여' 순으로 사원의 정보가 기록된 데이터이다.
# 벡터 EMP를 이용하여 다음과 같은 결과가 나타나도록 함수를 정의해보세요
# (함수에 변수 EMP를 전달했을 때 출력결과와 같도록 만드시면 됩니다)
# 
# + EMP <- c('2014홍길동220','2002이순신300','2010유관순260',"2019왕건500","2019동방신기1000")
# 
# <출력결과>
#   전체 급여 평균 : 456
# 평균이상 급여 수령자
# 왕건 => 500
# 동방신기 => 1000
library(stringr)
library(dplyr)
EMP <- c('2014홍길동220','2002이순신300','2010유관순260',"2019왕건500","2019동방신기1000")
f_res <- function(EMP){
  EMP_year <- substr(EMP,1,4)
  EMP_name <- unlist(str_extract_all(EMP, '[가-힣]{2,4}'))
  EMP_sal <- unlist(str_extract_all(EMP,'[가-힣]{2,4}[0-9]{1,}'))
  EMP_sal <- unlist(str_extract_all(EMP_sal, '[0-9]{1,}'))
  EMP_df <- data.frame(year = EMP_year,
                       name = EMP_name,
                       sal = as.integer(EMP_sal),stringsAsFactors = FALSE)
  str(EMP_df)
  EMP_good <- EMP_df %>% filter(EMP_df$sal > mean(EMP_df$sal))
  
  cat("전체 급여 평균 : ", mean(EMP_df$sal), "\n",
      "평균이상 급여 수령자", "\n")
  for(i in 1:length(EMP_good$name)){
    cat(EMP_good$name[i], "=>", EMP_good$sal[i], "\n")
  }
}
f_res(EMP)
EMP_good$name[1]


# 3. 함수 y = f(x)에서 x의 값이 a에서 b까지 변할 때 △x = b - a를 증분이라 하며,
# △y = f(b) - f(a)를 y의 증분으로 표현한다. 
# 평균변화율 : △y/△x = (f(b)- f(a))/(b - a) 
# 
# 조건) 함수 f(x) = x^3 + 4에서 x의 값이 1에서 3까지 변할 때 평균변화율을
# 구하는 함수를 작성해보세요. (평균변화율 = (f(3)-f(1))/(3-1) = 13)

cha <- function(a1,a2){
  c1 <- a1^3+4
  c2 <- a2^3+4
  cg_x <- a2-a1
  cg_y <- c2-c1
  return(cg_y/cg_x)
}

cha(1,3)



# 4. 실습 : 몬테카를로 시뮬레이션
# 
# 몬테카를로 시뮬레이션은 현실적으로 불가능한 문제의 해답을 얻기 위해서 난수의
# 
# 확률분포를 이용하여 모의시험으로 근사적 해를 구하는 기법
# 
# n번 시행했을 때 동전던지기의 확률을 구하라!

f_mon <-function(n){
  a <- 0
  for(i in 1:n){
    a<- a+sample(0:1,1)
  }
  re <- a / n
  return(re)
}

print(f_mon(10000))
