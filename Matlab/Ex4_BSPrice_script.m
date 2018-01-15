
% BS pricing Script %

S = 0:0.1:20;
K = 10;
r = 0.1;
tau = 0:90;
sigma = 0.3;
call_put = 'call';

% 차원 맞춰주기 : 둘 다 같은 크기의 행렬로 만들기 
[S_, tau_] = meshgrid(S,tau);

% Black Scholes Pricing
p = BSPrice(S_, K, r, tau_, sigma, call_put);

% 그래프 그리기
mesh(S_, tau_, p);
% 그래프 제목
title('BS European Call Option Price');
% x축 이름
xlabel('tau','Fontsize',16);
% y축 이름
ylabel('S','Fontsize',16);
% 컬러바 표시
colorbar();


