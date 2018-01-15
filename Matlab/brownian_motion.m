clear;
clc;

% Normal random Variable Plot

for i=1:100
    y(i) = randn();
end

plot(y)



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


% 1-D Brownian Motion Animation

for t=1:N
    plot(1:t, y(1:t), 'r');
    grid on;
    axis([0 N -5 5])
    hold on;
    drawnow;
end


% Geometric Brownian Motion Animation

N=100;
D=10;
sigma = 0.5;
mu = 0.3;

cmap = hsv(D);
for d=1:D
    p = ones(1, N);

    for t=2:N
        p(t) = p(t-1) * (1 + mu/N + sigma*randn()/sqrt(N));
    end
    for t=1:N
        plot(1:t, p(1:t), 'Color', cmap(d,:))
            grid on;
        axis([0 N 0 3])
        hold on;
        drawnow;
    end
end




