clear;
clc;

% 2D Brownian Motion Plot

N = 1000;
sigma = 0.1;

x = zeros(1, N);
y = zeros(1, N);

for j = 1:N
    for i = 1:N
        x(i+1, j) = x(i,j) + sigma*randn();
        y(i+1, j) = y(i,j) + sigma*randn();
    end
end

% Animation
for t=1:N
    plot(x(1:t), y(1:t), 'r');
    grid on;
    axis([-5 5 -5 5])
    hold on;
    drawnow;
end




