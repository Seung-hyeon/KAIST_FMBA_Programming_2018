LungCapData = read.csv(file.choose(), header=T)

library(plotly)

plot_ly(LungCapData, x=~Age, y=~Height, z=~LungCap,
        type='scatter3d', marker=list(size=2, color='red'))

x_axis = seq(min(LungCapData$Age), max(LungCapData$Age), 1)

y_axis = seq(min(LungCapData$Height), max(LungCapData$Height), 1)

fit = lm(LungCap ~ Age + Height, LungCapData)

fit_surface = expand.grid(Age=x_axis, Height=y_axis)

fit_z = matrix(predict.lm(fit, fit_surface), nrow=length(x_axis))

plot_ly(LungCapData, x=~Age, y=~Height, z=~LungCap, type='scatter3d', 
        marker=list(size=2, color='red')) %>%
  add_trace(z=t(fit_z), x=x_axis, y=y_axis, type='surface')
  