library(quantmod)

getSymbols("DJIA", src="FRED")

price = as.numeric(DJIA)
time = index(DJIA)

x = 1:length(price)
fit = lm(log(price)~x)
fit_exp = exp(fit$coef[1] + fit$coef[2]*x)

plot(x=time, y=price, main="Dow Jones", type="l")
lines(time, fit_exp, col=2, lwd=2)
