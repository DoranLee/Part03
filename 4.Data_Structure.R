# 데이터 구조 변경
# install.packages('reshape2')
library(reshape2)

data<-mtcars
data
str(data)
colSums(data)

# melt() : 데이터 녹이기
# melt(data, id.var(기준별), measure.vars(변환열))

# 모든 feature(열)에 대해 melt
melt(data)

# mpg와 cyl를 기준으로 나머지 반환
melt_data <- melt(data, id.var=c('mpg','cyl'), na.rm=T)
melt_data

# mpg와 cyl를 기준으로 원하는 요소만 반환
melt_data <- melt(data, id.var=c('mpg','cyl'), measure.vars = c('hp','gear'))
melt_data

# 중복값 제거
library(dplyr)
melt_data_rm <- distinct(melt_data)

# cast : 데이터 재구조화
# dcast() -> 데이터 프레임
# mpg와 cyl을 기준으로 데이터 분석
str(melt_data_rm)
dcast(melt_data_rm, mpg+cyl ~ variable, mean)
# row1 : mpg가 10.4, cyl이 8일때, hp와 gear의 mean이 각각 210, 3이다.
dcast(melt_data_rm, mpg+cyl ~ variable, length) 
# length : 개수

# acast() -> 벡터, 행렬, 리스트
# acast(data, 행 ~ 열, 값)
acast(melt_data_rm, cyl ~ mpg, mean)

# 실습
# iris 데이터에서 각 종에 따라 Sepal.Length, Sepal.Width의 평균값 구하기
str(iris)
melt_iris<-melt(iris, id.var='Species', measure.vars = c('Sepal.Length','Sepal.Width'))
View(melt_iris)
dcast(melt_iris, Species ~ variable, mean)
acast(melt_iris, Species ~ variable, mean)

# 실습2 w/ sample data
# 반별 수학 점수와 영어 점수 평균 구하기
library(readxl)
score <- read_excel('Part03_Process/middle_mid_exam.xlsx')
View(score)
melt_score <- melt(score, id.var='CLASS', 
                   measure.vars = c('MATHEMATICS','ENGLISH'))
dcast(melt_score, CLASS ~ variable, mean)
acast(melt_score, CLASS ~ variable, mean)

# 실습3 w/ airquality
View(airquality)
str(airquality)
colSums(airquality)

melt_air <- melt(airquality, id.var='Month', 
                 measure.vars = c('Ozone','Temp'), na.rm=T)
View(melt_air)
dcast(melt_air, Month ~ variable, mean)

