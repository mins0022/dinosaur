# 데이터 설명
# 
# ​
# 
# ratings 데이터 : user id, movie id, rating, time stamp
# 
# movies 데이터 : movie id, title, genres
# 
# user 데이터 : user id, gender, age, occupation, zip code
# 
# ​
# 
# 데이터 조사, 탐색적 분석, 전처리 등
# 
# 2-1) 성별에 따른 평균 평점은?
#   
#   2-2) 여성에게 인기 있는 top20 영화는?(단, 평가자 100명 이상)
library(dplyr)
#movie 불러오기 
movies <- readLines("movies.dat", encoding = "UTF-8")
movies <- gsub("::",";",movies)
movies2 <- read.csv(text = movies,header = F, encoding = "UTF-8", sep = ";", stringsAsFactors = FALSE)

movies3 <- rename(movies2,
                 c("movie_id" = "V1",
                   "title"="V2",
                   "genres"="V3"))
movies3$movie_id <- as.integer(movies3$movie_id)
#ratings 불러오기
ratings <- read.table(file = 'ratings.dat', encoding = "UTF-8", sep = ":")
ratings1 <- data.frame(user_id = ratings[,1],
                       movie_id = ratings[,3],
                       rating = ratings[,5],
                       time_stamp = ratings[,7],
                       stringsAsFactors = FALSE)

#user 불러오기
users<- read.table(file = 'users.dat', encoding = "UTF-8", sep = ":")
users <- data.frame(user_id = users[,1],
                    gender = users[,3],
                    age = users[,5],
                    occupation = users[,7],
                    zip_code = users[,9],
                    stringsAsFactors = FALSE)

#데이터 전처리 -> 데이터 프레임 만들기 #
#성별에 따른 평균 평점  #ratings 와 users 를 join으로 묶어서 select하자
gender_rating <- left_join(ratings1,users,by=c('user_id'= 'user_id')) %>% 
  select(rating, gender) %>% 
  group_by(gender) %>% 
  summarise(mean_gender_rating = mean(rating))

# 여성에게 인기 있는 top20 영화는?(단, 평가자 100명 이상) movies/leftjoin/ratings/lj/users

top_movie <- full_join(movies3,ratings1, by=c("movie_id"= "movie_id")) %>% select(movie_id,title,user_id,rating)

top_movie1 <- left_join(top_movie,users, by=c("user_id"="user_id"))
top_movie2 <- top_movie1 %>% filter(gender == "F") %>%  
  group_by(movie_id, title) %>% 
  summarise(cnt = n(), mean = mean(rating)) %>% 
  filter(cnt >= 100) %>% 
  arrange(desc(mean)) %>% 
  head(20)
#상위 20개의 영화를 불러 오기