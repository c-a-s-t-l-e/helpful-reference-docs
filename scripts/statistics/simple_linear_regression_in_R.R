### Simple Linear Regression Codes

# These codes allow you to do really quick calculations and plot diagnostic and model graphs of simple linear regression models

## LOAD THE LIBRARY

library(mosaic)
library(tidyverse)
library(car)

## LOAD THE DATA

dataSet = Orange # choose a dataset
view(dataSet)

## BUILD THE MODEL

# Variables
Y = dataSet$circumference # choose your response variable
X = dataSet$age # choose your explanatory variable


# Model
mylm = lm(Y ~ X, data=dataSet)

## ASSESS THE MODEL

# Model Summary
summary(mylm)

# Model Coefficents
intercept = coef(mylm)[1]
slope = coef(mylm)[2]

# Standard Errors of Coefficients
# Extract coefficients and standard errors
coefficients <- summary(mylm)$coefficients

# Get estimates and standard errors for intercept and slope
intercept_std_error <- summary(mylm)$coefficients["(Intercept)", "Std. Error"]
slope_std_error <- summary(mylm)$coefficients["X", "Std. Error"]

# Residual Standard Error
rse = summary(mylm)$sigma

# MSE
degrees_of_freedom = mylm$df.residual
MSE = sum(mylm$res^2) / degrees_of_freedom

# SSE
SSE = sum(mylm$res^2 )

# SSR
SSR = sum((mylm$fit - mean(Y))^2 )

# SSTO
SSTO = sum( (Y - mean(Y))^2 )

# R_SQUARED
R_SQUARED = SSR / SSTO

# r_correlation
r_correlation = sqrt(R_SQUARED)

# Predict a value
Xh = 2
predict(mylm, data.frame(X=Xh))

# Predict with prediction interval
predict(mylm, data.frame(X=Xh), level=0.95, interval="prediction")

# Predict with confidence interval
predict(mylm, data.frame(X=Xh), interval="confidence")

# Confidence interval
confint(mylm, level=0.95)

## PLOTS

# Assumption checks
par(mfrow=c(1,3))
plot(mylm,which=1:2)
plot(mylm$residuals)

# Plot the regression line
plot(Y ~ X, data = dataSet)
abline(mylm)

## TRANSFORMATIONS
bc <- boxCox(mylm)
lambda <- bc$x[which.max(bc$y)]

# lambda = R Code for the Model
# -2 = lm(Y^-2 ~ X)
# -1 = lm(Y^-1 ~ X)
# 0 = lm(log(Y) ~ X)
# 0.25 = lm(sqrt(sqrt(Y)) ~ X)
# 0.5 = lm(sqrt(Y) ~ X)
# 1 = lm(Y ~ X)
# 2 = lm(Y^2 ~ X)

## T-VALUES AND P-VALUES

# t-values
center_value = 0
t_intercept = (intercept - center_value) / intercept_std_error
t_slope = (slope - center_value) / slope_std_error

# p-values
t_value = t_slope
degrees_of_freedom = mylm$df.residual 
p_value <- 2 * pt(abs(t_value), df = degrees_of_freedom, lower.tail=FALSE)

# using qt to get the reverse t_value
reversed_t_value <- qt(p_value/2, df = degrees_of_freedom, lower.tail = FALSE) * sign(t_value)
