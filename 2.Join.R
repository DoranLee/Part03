# 데이터 결합하기
data1 <- read.csv('Part03_Process/join/join_1.csv')
data2 <- read.csv('Part03_Process/join/join_2.csv')
data3 <- read.csv('Part03_Process/join/join_3.csv')
data4 <- read.csv('Part03_Process/join/join_4.csv')

library(dplyr)

# 밑으로 붙이기
data_12 <- bind_rows(data1, data2)
data_13 <- bind_rows(data1, data3)

# 옆으로 붙이기
# 01 왼쪽 테이블을 기준으로 붙이기
left_34 <- left_join(data3, data4)
left_34_id <- left_join(data3, data4, by='ID')

# 02 공통 변수만 추출해서 붙이기
common_34 <- inner_join(data3, data4)

# 03 모든 변수를 추출해서 붙이기
full_34 <- full_join(data3, data4)
