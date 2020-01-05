rm(list = ls())

data = read.table("data/d_d_3.txt", header=TRUE)
attach(data)

lr.model = glm(family=binomial(), formula=rta~exp, data=data)
summary(lr.model)

Call:
  glm(formula = rta ~ exp, family = binomial(), data = data)

# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1.6049  -0.9123  -0.9123   0.8035   1.4680  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)   
# (Intercept)  -0.6614     0.3078  -2.149  0.03167 * 
#   exp           1.6265     0.5171   3.145  0.00166 **
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 105.306  on 75  degrees of freedom
# Residual deviance:  94.446  on 74  degrees of freedom
# AIC: 98.446
# 
# Number of Fisher Scoring iterations: 4