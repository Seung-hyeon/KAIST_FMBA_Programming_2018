
# 값 대입
a = 5 #or
a <- 5


# R 도움말 이용하기

#help('[물어볼 대상]')


# R 종료하기

#quit() #or
#q()


# 정의했던 변수 나열하기
ls()


# 타입 확인하기

#typeof('[확인할 대상]')


#----------------------------------------

# 벡터(배열) 생성
a = c(1, 2, 3)
a

# 열(column) 벡터 생성
cbind(a)

# 행(row) 벡터 생성
rbind(a)

# 벡터 transpose
t(a)

# 벡터 원소 참조
a[1]

a[2]


# 여러 원소 참조
a[2:3]

# 해당 원소 제외하고 참조
a[-1]


# 다양한 원소 추출 방법
# ---------------------
# 1. TRUE, FALSE를 이용한 추출
a[c(TRUE,FALSE,TRUE)]

a[c(FALSE,TRUE,FALSE)]


# 2. 인덱스 번호 배열을 이용한 추출
a[c(1,3)]


# 3. 논리 조건을 이용한 추출
a[a/2+1 > 2]

a[a%%3 == 1]




# 순차적인 벡터 생성
a = 1:3
a


# 간격이 정해져있는 벡터
a = seq(1, 2, 0.2)
a


# 




# 벡터 길이 확인
length(a)



a = c(1, 2, 3)
b = c(4, 5, 6)

# 벡터의 합과 차
a + b


a - b


# 재사용규칙(Recycling Rule)
c(1, 2, 4) + c(3, 5, 8, 2, 0)

# 벡터의 내적
a %*% b
rbind(a) %*% cbind(b)

# 벡터의 외적(Cross Product)
crossprod(a, b) # 이게 아님!




# 벡터의 외적(Outer Product)
a %o% b #or
cbind(a) %*% rbind(b)



# 방법 1
M = matrix(c(1,2,3,4,5,6,7,8,9), 
           nrow=3, ncol=3, byrow=FALSE)
M

# 방법 2 row 개수 하나만 지정
M = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
M 

m = 5
diag(m)

# 벡터의 내적





m = 5
n = 3
# 대각선 원소가 1로 구성된 mXm 정방행렬
diag(m)  

# 모든 원소가 0인 mXn 행렬 생성
matrix(0L, nrow=m, ncol=n)  

# 모든 원소가 1인 mXn 행렬 생성
matrix(1L, nrow=m, ncol=n)  






# 함수 만들기

# [함수명] = function(인수1, 인수2...){
#   
#   [명령문]
#   
#   return(결과)
# }

# 함수 정의
myfunction = function(x){
  
  y = sin(x)/x
  
  plot(x, y, type='l')
  
  return(y)
  
}

# 함수 실행
x = seq(-10,10,0.01)
myfunction(x)


# 행렬 A 생성
A = matrix(c(2,4,9,1,2,1,3,0,2), nrow=3, byrow = TRUE)


# 행렬 B 생성
B = matrix(c(5,5,2,2,2,1,1,3,3), nrow=3, byrow = TRUE)


# 행렬 곱 실행
A %*% B


if( [조건1] ){
  [명령문]
  
} else if( [조건2] ){
  [명령문]
  
} else{
  [명령문]
  
}


# Example
a = 1

if (a<0){
  
  b = -1
  
} else if (a>1){
  
  b = 1
  
} else{
  
  b = 0
  
}

# 실행하면 b=0




# for 문 : 반복적인 작업 수행

for (변수 in 범위){
  
  [명령문]
  
  if( [탈출조건] ){
    break
  }
  
}


# Example
j = 0

for (i in 0 : 100){
  
  j = j + i

  if(i>4){
    break
  }

}

# 실행하면 j=15 이 실행됨


# while 문 : 반복회수가 정해지지 않을 때 사용

while([반복조건]){
  
  [명령문]
  
}

# Example (for 문과 정확히 동등한 예)
j = 0
i = 0

while(i<=5){
  
  j = j + i
  
  i = i + 1
  
}

# 실행하면 j=15 이 실행됨




# 현재 설치된 패키지 목록 확인

installed.packages()


# 패키지 설치

install.packages([패키지 이름])


# ggplot2 패키지 설치

install.packages("plotly")
# CRAN mirror는 Korea로 선택


# plotly 패키지 사용하기

library(plotly)



# x값 설정
x = seq(-50,50,0.01)


# x에 따른 y값 계산
y = sin(x)/x


# ggplot2로 그래프 그리기
qplot(x,y, 
      
      main='sin(x)/x',
      
      xlab='x',
      
      ylab='y')



# plotly 패키지 설치
install.packages(plotly)
# plotly 불러오기
library(plotly)


# x값 설정
x = seq(-20,20,0.2)

# y값 설정
y = seq(-20,20,0.2)

# z값 계산
z = outer(x, y, 
          function(x, y) sin(sqrt(x^2 + y^2))/sqrt(x^2 + y^2))

# plotly surface 그리기
plot_ly(x=x,y=y,z=z) %>% add_surface()


# 가상의 데이터 생성하기
x=1:20
y=3+2*x + 4*rnorm(20)

data = data.frame(x=x, y=y)


# ggplot을 이용하여 그래프 그리기
library(ggplot2)
qplot(x=x, y=y, data=data)


# lm을 이용한 회귀분석
fit = lm(y~x, data=data)
summary(fit)

# 그래프 그리기
plot(data)
abline(fit)










ggplot(data, aes(x=x, y=y))+
  geom_point(shape=1)+
  geom_smooth(mehotd=lm)




# 데이터 불러오기

LungCapData = read.csv(file.choose(), header=T, sep='\t')



# 데이터 표시하기

library(plotly)

plot_ly(LungCapData, x=~Age, y=~Height, z=~LungCap, 
        type='scatter3d', marker=list(size=2, color='black'))



# fitting Surface 만들기

x_axis = seq(min(LungCapData$Age), max(LungCapData$Age), 1)

y_axis = seq(min(LungCapData$Height), max(LungCapData$Height), 1)

fit = lm(LungCap~Age+Height, LungCapData)

fit_surface = expand.grid(Age=x_axis, Height=y_axis)

fit_z = matrix(predict.lm(fit, fit_surface), nrow=length(x_axis))



# 그래프 그리기

plot_ly(LungCapData, x=~Age, y=~Height, z=~LungCap, type='scatter3d',
        marker=list(size=2, color='black')) %>%
  
add_trace(z=t(fit_z), x=x_axis, y=y_axis,type='surface')


df = data.frame(LungCap=c(6.475, 10.125, 9.550, 11.125...),
                Age=c(6,18,16,14,5,11,8,11,15,11,19,17...),
                Height=c(62.1,74.7,69.7,71.0,56.9,58.7...),
                ...)
df = LungCapData


# 다우 존스 추세 분석

getSymbols("DJIA", src="FRED")

price = as.numeric(DJIA)
time = index(DJIA)

x = 1:length(price)
fit = lm(log(price)~x)
fit_exp = exp(fit$coef[1] + fit$coef[2]*x)

plot(x=time, y=price, main="Dow Jones", type="l")
lines(time, fit_exp, col=2, lwd=2)

getSymbols("AAPL", src="yahoo")
apRd = periodReturn(AAPL, period="daily", type="log")
dsd = density(apRd)
yl = c(min(dsd$y), max(dsd$y))
plot(dsd, main=NULL, ylim=yl)

a = seq(min(apRd), max(apRd), 0.001)
points(a, dnorm(a, mean(apRd), sd(apRd)), type="l", lty=2)