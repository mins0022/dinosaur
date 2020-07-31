install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx") # 같은 폴더 안에 있을 때 이름으로 불러오기
df_exam
df_exam <- read_excel("C:/R-stu/rsource/excel_exam.xlsx") # 경로를 지정해서 엑셀 파일을 불러오기
df_exam

df_exam_novar <- read_excel("C:/R-stu/rsource/Doit_R/Data/excel_exam_novar.xlsx", col_names = F) #열이름을 가져올 것인가? T/F ->엑셀의 첫번째 열이 필요한 경우/ 아닌경우
df_exam_novar

df_csv_exam <- read.csv("C:/R-stu/rsource/Doit_R/Data/csv_exam.csv")
df_csv_exam

df_csv_exam2 <- read.csv("C:/R-stu/rsource/Doit_R/Data/csv_exam.csv", stringsAsFactors = F) #문자가 들어있는 csv 파일을 가져올 대는 stringAsFactors = F 기입 -> 변수를 factor 타입이 아닌 문자 타입으로 불러온다.
df_csv_exam2

df_midterm <-data.frame(english = c(90,80,60,70),
                        math = c(50,60,100,20),
                        class = c(1,1,2,2))
df_midterm

write.csv(df_midterm, file = "df_midterm.csv") # df_midterm 데이터를 csv로 저장하는데 df_midterm.csv로 저장한다.

saveRDS(df_midterm, file = "df_midterm.rds")
rm(df_midterm)
df_midterm <- readRDS("df_midterm.rds") # RDS는 R 전용 파일로써 R에서 읽는 속도가 빠르고 용량이 작다
df_midterm


