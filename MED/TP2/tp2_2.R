rm(list=ls())

data.full=read.table("data/le.txt", header = TRUE)

# Primero separamos los datos en train y test set.
set.seed(42)

train_ind <- sample(1:nrow(data.full), 0.85 * nrow(data.full))
test_ind <- setdiff(1:nrow(data.full), train_ind)

data.train = data.full[train_ind,]
data.test = data.full[test_ind,]

lr.model = glm(data=data.full, formula=data.full$rta~data.full$exp, family=binomial)
summary(lr.model)

# Call:
#   glm(formula = data.full$rta ~ data.full$exp, family = binomial, 
#       data = data.full)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -2.0144  -0.9120  -0.8165   1.2871   1.5971  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)  
# (Intercept)   -1.92703    0.92104  -2.092   0.0364 *
#   data.full$exp  0.02040    0.01257   1.624   0.1045  
# ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 70.252  on 52  degrees of freedom
# Residual deviance: 67.116  on 51  degrees of freedom
# AIC: 71.116
# 
# Number of Fisher Scoring iterations: 4

lr.model.proba = predict(lr.model, data.full, type="response")

roc_obj = roc(data.full$rta, lr.model.proba)

plot(roc_obj, print.auc=TRUE)









lr.model2 = glm(data=data.train, formula=data.train$rta~data.train$exp, family=binomial)
summary(lr.model2)

# Call:
#   glm(formula = data.train$rta ~ data.train$exp, family = binomial, 
#       data = data.train)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1.8227  -0.9157  -0.8362   1.3142   1.5701  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)  
# (Intercept)    -1.69537    0.91798  -1.847   0.0648 .
# data.train$exp  0.01682    0.01215   1.384   0.1664  
# ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 59.667  on 44  degrees of freedom
# Residual deviance: 57.503  on 43  degrees of freedom
# AIC: 61.503
# 
# Number of Fisher Scoring iterations: 4


lr.model2.proba = predict(lr.model2, data.test, type="response")

roc_obj2 = roc(data.train$rta, lr.model2.proba)

plot(roc_obj2, print.auc=TRUE)
