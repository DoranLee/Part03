# install.packages('dplyr')
library(dplyr)

data <- iris
str(data)

# 01. 변수에서 원하는 요소에 해당하는 행 추출
filter(data, Species=='setosa')
filter(data, Species=='setosa'|Species=='versicolor')
filter(data, Species=='versicolor' & Sepal.Length<6)

# 02. 원하는 열 추출
select(data, Sepal.Length)
select(data, Sepal.Length, Sepal.Width)

# 03. 데이터 정렬
# 오름차순
arrange(data, Sepal.Length)
arrange(data, Sepal.Length, Sepal.Width) # 먼저 나온 것 우선으로

# 내림차순
arrange(data, desc(Sepal.Width))
arrange(data, Sepal.Length, desc(Sepal.Width))

# 04. 열 추가하기
mutate(data, class='y')

temp <- rep(c(1,1,2), time=50)
mutate(data, class=temp)

mutate(data, SL_rank=rank(Sepal.Length))

# 05. 중복값 제거 distinct(), unique()
View(mtcars)
data<-mtcars

# 열 추출하여 같은 값을 가지는 행 제거
distinct(data, cyl)
distinct(data, cyl, gear)
data <- unique(data)

# 똑같은 행 추가
row <- list(21.0, 6, 160.0, 110, 3.90, 2.620, 16.46, 0, 1, 4,4)
data <- rbind(data, row)

# 06. 샘플링 - 랜덤으로 추출
sample_n(data, 5)  # 5개 샘플링
sample_frac(data, 0.4)  # 40% 샘플링

# 07. 파이프 연산자 : %>%
# -> 연결해서 연산, 무제한 연결 가능

# w/o 파이프 연산자
data<-mutate(data, mpg_rank=rank(mpg))
arrange(data, mpg_rank, cyl)

# w/ 파이프 연산자
mutate(data, mpg_rank=rank(mpg)) %>% arrange(mpg_rank)
# --> 새로운 변수를 사용하지 않아도 가능

data %>% filter(cyl==4)
data %>% filter(cyl==6 & hp==110)

data %>% select(mpg)
data %>% select(mpg, hp)
data %>% select(-cyl)

data %>% arrange(disp)
data %>% arrange(desc(disp))
