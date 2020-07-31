exam <- read_excel("excel_exam.xlsx")
# + head() 파일의 상위 6개를 불러옴
head(exam) #6개
head(exam, 10) #지정해줄 수 있음
# + tail() 파일의 하위 6개를 불러옴
tail(exam)
tail(exam, 10) #위와 동일
# + View() 파일 테이블 형태로 보여줌
View(exam)
# + dim()
dim(exam) #r by c 를 보여줌 행 * 열
# + str()
str(exam) # 각 열의 값을 나눠 보여줌
# + summary()
summary(exam) # 각 열의 최소값, 1Q, 중간값, 평균, 3Q, 최대값

?mpg
a <-(mpg[8])

