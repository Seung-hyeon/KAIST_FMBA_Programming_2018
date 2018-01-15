
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