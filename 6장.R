#데이터 전처리를 위한 dplyr 공부하기
#filter()
#select()
#arrange()
#mutate()
#summartise()
#group_by()
#left_join()
#bind_row --> rbind, cbind
library(dplyr)
exam <- read.csv("Doit_R/Data/csv_exam.csv")
exam %>% filter(class == 1)  # dlpyr 패키지에서는 %>%기호를 이용해 함수들을 나엻는 방식으로 코드를 작성한다.

exam %>% filter(class %in% c(1,3,5)) # %in% 는 매치연산자로 in 함수

library(ggplot2)
mpg
#자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고합니다. displ이 4이하인 자동차와 5이상인 어떤 자동차의 hwy가 평균적으로 더 높은가
under4 <-mpg %>% filter(displ <= 4)
over5 <- mpg %>% filter(displ >= 5)
ifelse(mean(under4$hwy) >= mean(over5$hwy), "4", "5")

#자동차 제조 회사에 따라 도시 연비가 다른지 알아보려합니다. "audi"와 "toyota" 중 어느 manufacturer의 cty가 평균적으로 더 높은지 알아보세여
audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")

ifelse(mean(audi$cty)>mean(toyota$cty), "audi", "toyota")

#"chevrolet","ford","honda" 자동차의 고속도로 연비 평균을 알아보려고합니다. 이 회사들의 데이터를 추출한 후 Hwy 전체 평균을 구하시오

car_hwy <- mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
mean(car_hwy$hwy)



exam %>% select(math)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>%
  filter(class == 1) %>%
  select(english) # filter 후 select

exam %>%
  select(id,math) %>%
  head

#mpg 데이터는 11개 변수로 구성되어 있다. 이 중 일부만 추출해 분석에 활용하려고 합니다. mpg 데이터에서 class, cty, 변수를 추출해 새로운 데이터를 만드세여, 새로 만든 데이터의 일부를 출력해 두 변수로만 구성되어 있는지 확인해시오

mpg_1 <- mpg %>% select(c(class,cty))
mpg_1

#자동차 종류에 따라 도시 연비가 다른지 알아보려고한다. 앞에서 추출한 데이터를 이용ㅎ class가 suv인 자동차와 compact인 자동차 중 어떤 자동차의 cty평균이 더 높은지 알아보세요

mpg_suv <- mpg_1%>% filter(class == "suv")
mpg_compact <-mpg_1 %>% filter(class == "compact")

mean(mpg_suv$cty)
mean(mpg_compact$cty)

#arrange()
exam %>% arrange(math) #math 를 기준으로 오름차순
exam %>% arrange(desc(math))
exam %>% arrange(class, math) #반을 기준으로 오름차순 -> 점수를 기준으로 오름차순

mpg %>% filter(manufacturer == "audi") %>% select(hwy) %>% arrange(desc(hwy)) %>% head(5)


