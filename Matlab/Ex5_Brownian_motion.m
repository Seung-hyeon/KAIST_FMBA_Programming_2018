clear;
clc;

% 2D Brownian Motion Plot

N = 500;
sigma = 0.1;

x = zeros(N);
y = zeros(N);


for i = 1:N
    x(i+1) = x(i) + sigma*randn();
    y(i+1) = y(i) + sigma*randn();
end

% Animation
for t=1:N
    plot(x(1:t), y(1:t), 'r');
    grid on;
    axis([-5 5 -5 5])
    hold on;
    drawnow;
end




