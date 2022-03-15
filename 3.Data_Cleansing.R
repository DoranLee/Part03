# 결측치(NA:Not Available)
# --> 계산할 수 없으므로 제거 혹은 변경

# 결측치 존재 확인 - is.na()
a <- c(1:10, NA, 12:20)
sum(a)  # --> Error
is.na(a)  # 결측치 확인
sum(is.na(a))  # 결측치 개수 확인
table(is.na(a))

sum(a, na.rm=T)  # 결측치(NA) 무시하고 계산

data1 <- read.csv('Part03_Process/join/is_na.csv')
str(data1)

# Column별로 결측치 개수 확인
colSums(data1)
colSums(is.na(data1))

sum(is.na(data1))  # 전체 결측치 개수 확인

# 결측치 제거
na.omit(data1)  # 결측치가 있는 모든 행 제거(웬만하면 지양..)

# 결측치 대체
# 해당 열의 평균으로 대체, 회귀를 통한 대체, 최빈값 등..

data1
str(data1)

data1[3]  # 3번째 열(데이터프레임 형식)
data1$cyl  # 벡터 형식
data1[[3]]  # 벡터 형식
data1[,3]  # 벡터 형식

is.na(data1$cyl)
is.na(data1[3])

mean(data1[[3]], na.rm=T)  # 결측치를 제외하고 계산
# mean(data1[3], na.rm=T)  --> 데이터 프레임 형식은 계산X


# 각 요소마다의 특성을 살펴보고, 결측치를 각각 다르게 처리해야함

# 결측치에 열평균값 넣기
# sapply 활용 --> sapply(x, function) : 연산결과 벡터로 반환
# ifelse(조건식, A, B) : 조건식이 참이면 A, 아니면 B
# --> NA가 참이면 A(평균값), 아니면 B(원래값)
sapply(data1, function(x) ifelse(is.na(x), mean(x, na.rm=T), x))

# 이상치
boxplot(data1)
boxplot(data1$hp)
# (아래서부터) 최저 이상치 경계 - 1사분위수 - 중앙값(굵은선) 
# - 3사분위수 - 최고 이상치 경계 --> str stats에서 확인 가능
str(boxplot(data1$hp))
boxplot(data1$hp)$stats  # 기술통계량 확인

# 이상치 처리
data1$hp > 175
data1$hp <- ifelse(data1$hp>175, NA, data1$hp)
data1$hp

# 이상치 처리후 결측치 값 관리
