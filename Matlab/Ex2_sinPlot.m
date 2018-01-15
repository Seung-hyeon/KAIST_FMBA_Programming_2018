

% x 값을 -10부터 10까지 0.01 간격으로 생성
x = -10:0.01:10;

% x 값에 대응되는 y = sin(x)/x 를 생성
y = sin(x) ./ x;

% 그래프 그리기
plot(x,y);

% myfunction 호출
y = myfunction(x);
