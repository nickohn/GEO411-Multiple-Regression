sales <- read.csv("homeSales.csv")
names(sales)

#Estimate base model
base.model <- lm(price ~ bedrooms + bathrooms + sqft_living + yr_built + HS + SC, data = sales)

summary(base.model)

#Diagnostic plots
plot(base.model)

#Independence and right hand side variables
ResidualVsXPlots <- function(mod.in){
  var.names <- names(mod.in$coefficients)
  n.x.vars <- length(var.names)
  mod.e <- residuals(mod.in)
  
  for (i in 2:n.x.vars){
    plot (mod.in$model[,var.names[i]], mod.e, xlab = var.names[i], ylab = "residuals")
    lines(lowess(mod.in$model[,var.names[i]],mod.e, f=3/4), col="red")
    locator(1)
  }
}

ResidualVsXPlots(base.model)

#Homoskedasticity and right hand side variables
XScaleLocationPlots <- function(mod.in){
  var.names <- names(mod.in$coefficients)
  n.x.vars <- length(var.names)
  std.residuals <- sqrt(abs(rstandard(mod.in)))
  
  for (i in 2:n.x.vars){
    plot (mod.in$model[,var.names[i]], std.residuals, xlab = var.names[i], 
          ylab = "Square root of Absolute Standardized Residuals")
    lines(lowess(mod.in$model[,var.names[i]], std.residuals, f=3/4), col="red")
    locator(1)
  }
}

XScaleLocationPlots(base.model)

library(car)
vif(base.model)

#My model
my.model <- lm(log(price) ~ bedrooms + bathrooms + GRAD + BACH + yr_built, data = sales)

summary(my.model)
plot(my.model)

vif(my.model)

XScaleLocationPlots <- function(mod.in){
  var.names <- names(mod.in$coefficients)
  n.x.vars <- length(var.names)
  std.residuals <- sqrt(abs(rstandard(mod.in)))
  
  for (i in 2:n.x.vars){
    plot (mod.in$model[,var.names[i]], std.residuals, xlab = var.names[i], 
          ylab = "Square root of Absolute Standardized Residuals")
    lines(lowess(mod.in$model[,var.names[i]], std.residuals, f=3/4), col="red")
    locator(1)
  }
}

XScaleLocationPlots(my.model)
