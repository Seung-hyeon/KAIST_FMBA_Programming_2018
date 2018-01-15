
% BS pricing Script %

S = 0:0.1:20;
K = 10;
r = 0.1;
tau = 0:90;
sigma = 0.3;
call_put = 'call';

% ���� �����ֱ� : �� �� ���� ũ���� ��ķ� ����� 
[S_, tau_] = meshgrid(S,tau);

% Black Scholes Pricing
p = BSPrice(S_, K, r, tau_, sigma, call_put);

% �׷��� �׸���
mesh(S_, tau_, p);
% �׷��� ����
title('BS European Call Option Price');
% x�� �̸�
xlabel('tau','Fontsize',16);
% y�� �̸�
ylabel('S','Fontsize',16);
% �÷��� ǥ��
colorbar();


