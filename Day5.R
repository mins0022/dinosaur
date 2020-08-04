#KoNLP패키지 설치 및 부착
install.packages("multilinguer")
library(multilinguer)
install.packages(c('stringr','hash','tau','sejong','RSQLite','devtools'), type = "binary")
install.packages("remotes")

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", force =TRUE,
                        INSTALL_opts = c("--multiarch"))
library(KoNLP)
library(rJava)

#제주 dic를 만들기 위한 작업 - txt파일을 직접만듬
j_dic <- readLines(
  con = "C:\\R-stu\\R_study\\제주도dic.txt", encoding = 'UTF-8'
)
j_dic
#딕셔너리에 ncn을 붙임
j_dic2 <- data.frame(관광지 = j_dic,ncn = "ncn")
j_dic2

#딕셔너리에 저장 #replcae_user_dic =T로 기존의 user_dic는 제거하고 덮어쓰게 된다.
KoNLP::buildDictionary()
buildDictionary(user_dic = j_dic2,
                replace_usr_dic = F)
#딕셔너리의 경로를 추적해서 들어갔는지 확인
.libPaths()

#제주 데이터 불러오기
jeju_data <- readLines(
  con = "C:\\R-stu\\R_study\\jeju.txt")
#제주 데이터 단어를 명사만 가져오기
jdata <- sapply(jeju_data, KoNLP::extractNoun,
                USE.NAMES = FALSE)
#unlist를 통해 list를 벡터화
jda <- unlist(jdata)

#gsub를 통해 불용어 제거 -> 불용어 관련 파일을 만들어서 한번에 제거하는 방법
#for(i in 1:length(add_dic)){
#mergeUserDic(data.frame(add_dic[i], "ncn"))
#}
jda <- gsub("다음","",jdata)
jda <- gsub("[0-9]","",jda)
jda <- gsub('제주','',jda)
jda <-gsub('제주도','',jda)
jda <-gsub('[0-9]+','',jda)
jda <-gsub('거실','',jda)
jda <-gsub('오후','',jda)
jda <-gsub('/','',jda)
jda <-gsub('\\.','',jda)
jda <-gsub('-','',jda)
jda <-gsub('?','',jda)
jda <- gsub('추천','',jda)
jda <- gsub('흑돼지','',jda)
jda <- gsub('가게','',jda)
jda <- gsub('^[가-힣]','',jda)
jda <- Filter(function(x){nchar(x)>=2},jda)
jda <- gsub('제주','',jdata2)
jda <-gsub('제주도','',jda)
jda <-gsub('오전','',jda)
jda <-gsub('오후','',jda)
jda <-gsub('/','',jda)
jda <-gsub('\\.','',jda)
jda <-gsub('-','',jda)
jda <- gsub('추천','',jda)
jda <- gsub('흑돼지','',jda)
jda <- gsub('가게','',jda)
jda <- gsub('쪽','',jda)
jda <- gsub('^ㅇ','',jda)
jda <- gsub('것','',jda)
jda <-gsub('숙소','',jda)
jda <-gsub('시간','',jda)
jda <-gsub('여행','',jda)
jda <-gsub('해안','',jda)
jda <- gsub("가격", "", jda)
jda <- gsub("-"," ",jda)
jda <- gsub("?", "", jda)
jda <- gsub('/',' ',jda)
jda <- gsub("제주", "", jda)
jda <- gsub("추천", "", jda)
jda <- gsub("오전", "", jda)
jda <- gsub("오후", "", jda)
jda <- gsub("월일", "", jda)
jda <- gsub("시분", "", jda)
jda <- gsub("출발", "", jda)
jda <- gsub("도착", "", jda)
jda <- gsub("여행지", "", jda)
jda <- gsub('\\.','',jda) #마침표, ... 제거하기 위함
jda <- gsub("]", "", jda)
jda <- gsub("\\[", "", jda)
jda <- gsub("소", "", jda)
jda <- gsub("숙", "", jda)
jda <- gsub("해안", "", jda)
jda <- gsub("여행", "", jda)
jda <- gsub("것", "", jda)
jda <- gsub("곳", "", jda)
jda <- gsub("시간", "", jda)
jda <- gsub("날", "", jda)
jda <- gsub("분", "", jda)
jda <- gsub("코스", "", jda)
jda <- gsub("관광지", "", jda)
jda <- gsub("공항", "", jda)
jda <- gsub("전망", "", jda)
jda <- gsub("경유", "", jda)
jda <- gsub("정보", "", jda)
jda <- gsub("데", "", jda)
jda <- gsub("체험", "", jda)
jda <- gsub("하루", "", jda)
jda <- gsub("하게", "", jda)
jda <- gsub("하시", "", jda)
jda <- gsub("일정", "", jda)
jda <- gsub("예약", "", jda)
jda <- gsub("이용", "", jda)
jda <- gsub("가능", "", jda)
jda <- gsub("다양", "", jda)
jda <- gsub("관광", "", jda)
jda <- gsub("위치", "", jda)
jda <- gsub("산책", "", jda)
jda <- gsub("둘째", "", jda)
jda <- gsub("정도", "", jda)
jda <- gsub("드라이브", "", jda)
jda <- gsub("야간", "", jda)
jda <- gsub("파도","", jda)
jda <- gsub("깨끗", "", jda)
jda <- gsub("[0-9]", "", jda)jda <-gsub('코스','',jda)

#wordcloud를 그리기 위한 패키지/색을 입히기 위한 Brewer
install.packages(c('RColorBrewer','wordcloud'))
library(RColorBrewer)
library(wordcloud)

table(jda)
#wordcount에서 빈도수에 따른 정렬
wdcount <- head(sort(table(jda),decreasing = T),50)
wdcount
#색 지정
palette <- brewer.pal(9,"Set1")
#wordcloud 생성
wordcloud(names(wdcount),freq = wdcount, scale = c(10,0.2),
          rot.per = 0.2, min.freq=1,
          random.order= F, random.color = T, colors = palette)
#random.order =T(랜덤배치)/F(빈도수가 가장 큰단어를 중앙배치)
#

#teacher.ver

#불용어 목록 만들고, 불러오기
no <- readLines(con='./data/불용어.txt',
                encoding = 'UTF-8')

for( i in 1:length(no)){
  place_re <- gsub(pattern = no[i],"",x = place_re)
}

#문자길이 2개 이상 단어 추출
place_re <- Filter(function(x){
  nchar(x) >= 2 #nchar()는 문자길이 추출
},place_re)
nchar("김민수")

?wordcloud
install.packages("wordcloud2")
library(wordcloud2)
# wordcloud2(data=wdcount,fontFamily = '나눔바른고딕')
wordcloud2(wdcount,color = "random-light", backgroundColor = "grey",fontFamily = '나눔바른고딕')
#wordcloud2의 패키지로서 컴퓨터 사양과 git에서 끌어다 쓰는 wordcloud2에서만 가능하다.
letterCloud(data = wdcount,word='민수',wordSize=1,fontFamily='나눔바른고딕')
