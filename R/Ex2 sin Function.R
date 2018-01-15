myfunction = function(x){
  
  y = sin(x)/x
  
  plot(x, y, type='l')
  
  return(y)
  
}

x = seq(-10, 10, 0.01)
myfunction(x)
