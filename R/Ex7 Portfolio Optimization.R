install.packages(c("PortfolioAnalytics", "quantmod", "PerformanceAnalytics", 
                   "zoo", "plotly", "ROI.plugin.quadprog", "ROI.plugin.glpk"))

library(PortfolioAnalytics)
library(quantmod)
library(PerformanceAnalytics)
library(zoo)
library(plotly)


# Get data
getSymbols(c("MSFT", "NVDA", "IBM", "AAPL", "FB", "AMZN"),from = " 2015-01-01",src = 'yahoo')

# Assign to dataframe
# Get adjusted prices
prices.data <- merge.zoo(MSFT[,6], NVDA[,6], IBM[,6], AAPL[,6], FB[,6], AMZN[,6])

# Calculate returns
returns.data <- sapply(prices.data, CalculateReturns)
returns.data <- na.omit(returns.data)

# Set names
colnames(returns.data) <- c("MSFT", "NVDA", "IBM", "AAPL", "FB", "AMZN")

# Save mean return vector and sample covariance matrix
meanReturns <- colMeans(returns.data)
covMat <- cov(returns.data)


# Start with the names of the assets
p <- portfolio.spec(assets = colnames(returns.data))

# Box
p <- add.constraint(p, type = "box", min = 0.05, max = 0.8)
# Leverage
p <- add.constraint(portfolio = p, type = "full_investment")

# Generate random portfolios
randomport<- random_portfolios(p, permutations = 50000, rp_method = "sample")

p <- add.constraint(portfolio = p, type = "full_investment")
p <- add.constraint(p, type="long_only")
# Get minimum variance portfolio
minvar.port <- add.objective(p, type = "risk", name = "var")

# Optimize
minvar.opt <- optimize.portfolio(returns.data, minvar.port, optimize_method = "random", 
                                 rp = randomport)

# Generate maximum return portfolio
maxret.port <- add.objective(p, type = "return", name = "mean")

# Optimize
maxret.opt <- optimize.portfolio(returns.data, maxret.port, optimize_method = "random", 
                                 rp = randomport)

# Generate vector of returns
#minret <- 0.02/100
minret <- min(meanReturns)
maxret <- max(meanReturns)
#maxret <- maxret.opt$weights %*% meanReturns

vec <- seq(minret, maxret, length.out = 100)


eff.frontier <- data.frame(Risk =vector("numeric", length(vec)) ,
                           Return = vector("numeric", length(vec)))

frontier.weights <- mat.or.vec(nr = length(vec), nc = ncol(returns.data))

colnames(frontier.weights) <- colnames(returns.data)

for(i in 1:length(vec)){
  
  # Creates a new portfolio object using p and adds mean as an objective
  
  p <- add.constraint(p, type = "return", name = "mean", return_target = vec[i])
  
  # Creates a new portfolio object using p and adds var as an objective
  p <- add.objective(p, type = "risk", name = "var")
  
  # Creates a new portfolio object using p and adds a weight_concentration
  # objective. The conc_aversion parameter controls how much concentration is
  # penalized. The portfolio concentration is defined as the Herfindahl Hirschman
  # Index of the weights.
  p <- add.objective(p, type = "weight_concentration", name = "HHI",
                     conc_aversion = 0.01)
  
  eff.opt <- optimize.portfolio(returns.data, p, optimize_method = "ROI")
  
  eff.frontier$Risk[i] <- sqrt(t(eff.opt$weights) %*% covMat %*% eff.opt$weights)
  
  eff.frontier$Return[i] <- eff.opt$weights %*% meanReturns
  
  
  
  frontier.weights[i,] = eff.opt$weights
  
  # print(paste(round(i/length(vec) * 100, 0), "% done..."))
  
}
eff.frontier$Sharperatio <- eff.frontier$Return / eff.frontier$Risk

feasible.sd <- apply(randomport, 1, function(x){
  return(sqrt(matrix(x, nrow = 1) %*% covMat %*% matrix(x, ncol = 1)))
})

feasible.means <- apply(randomport, 1, function(x){
  return(x %*% meanReturns)
})

feasible.sr <- feasible.means / feasible.sd
p <- plot_ly() %>%
  add_trace(x = feasible.sd, y = feasible.means, color = feasible.sr, 
            mode = "markers", type = "scattergl", showlegend = F,
            
            marker = list(size = 3, opacity = 0.5, 
                          colorbar = list(title = "Sharpe Ratio"))) %>%
  add_trace(data = eff.frontier, x = ~Risk, y = ~Return,mode = "markers", type = "scattergl")%>% 
  layout(title = "Efficient Frontier",
         yaxis = list(title = "Mean Returns", tickformat = ".2%"),
         xaxis = list(title = "Standard Deviation", tickformat = ".2%"))
p

