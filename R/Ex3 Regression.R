x = 1:20
y = 3 + 2*x + 4*rnorm(20)

data = data.frame(x=x, y=y)

library(ggplot2)
qplot(x=x, y=y, data=data)

fit = lm(y~x, data=data)
summary(fit)

plot(data)
abline(fit)
