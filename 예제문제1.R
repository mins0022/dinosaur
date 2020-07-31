  #1.
  install.packages("ggplot2")
  library(ggplot2)
  vec1 <- rep("R",5)
  vec2 <- seq(1,10,3)
  vec3 <- rep(seq(1,10,3),3)
  vec4 <- rep(vec2,3)
  vec5 <- seq(25,-15,-5)
  vec6 <- vec4[seq(1,length(vec4), 2)]
  
  df_user <- data.frame(name = c('최민수','유관순','이순신','김유신','홍길동'),
                        age = c(55,45,45,53,15),
                        gender = c(1,2,1,1,1),
                        job = c('연예인','학생','군인','직장인','무직'),
                        sat = c(3,4,2,5,5),
                      grade = c('C','C','A','D','A'),
                      total = c(44.4, 28.5,43.5,NA,27.1),stringsAsFactors = FALSE)
  
  barplot(table(df_user$gender)) #테이블 형으로 바꿔서 명목형 변수로 바꿈 #테이블은 빈도를 셀수 있게 해줌
  plot(as.factor(df_user$gender))
  
  
  
  qplot(data = df_user, x = gender) #qlpot을 이용한 방법
    df_gender <- unlist(df_user[3])
  ?qplot
  df_midterm <- data.frame(kor = c(90,85,90),
                           eng = c(70,85,75),
                           mat = c(86,92,88))
  apply(df_midterm,1,max)
  apply(df_midterm,2,max)
  round(apply(df_midterm,1,mean),digits =2)
  round(apply(df_midterm,2,mean),digits = 2)
  
  plot(iris) # plot 함수는 어떤것을 말하던간에 맞는 함수를 보여준다
