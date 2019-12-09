#Se ha realizado un estudio para ver si el peso en kg (rta) de unos deportistas depende de su cintura en cm (exp1), 
#del nu ́mero de km de entrenamiento (exp2) y del tipo de entrenamiento (exp3=1: Body building, exp3=2: Fitness).
#Han participado en el estudio 26 individuos. Los datos experimentales est ́an en el fichero c ccd.txt

#Cargamos los datos:
rm(list=ls())
detach(datos)

datos=read.table('data_sets/c_ccd.txt', header = TRUE)
attach(datos)

# Se pide:
#   1-Interpretar los resultados del modelo de regresi ́on lineal con todas las variables.
#   2-Repetir el an ́alisis quitando las variables no significativas. ¿Qu ́e sucede?
#   3-Crear una variable interacci ́on entre exp1 y exp3 e incorporarla al modelo anterior.¿que ocurre?
#   4-Elegir de los tres modelos anteriores el mejor. ¿Se cumplen las condiciones de aplicabilidad de la regresión lineal?
#   5-Elaborar otro enunciado para estos datos.

### 1 ####
summary(datos)

model.lr = lm(data = datos, formula = rta~exp1+exp2+exp3)
summary(model.lr)

# Call:
#   lm(formula = rta ~ exp1 + exp2 + exp3, data = datos)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -1.7642 -0.5996  0.1003  0.4577  1.4069 
# 
# Coefficients:
#             Estimate   Std. Error t value  Pr(>|t|)    
# (Intercept) 23.35297    3.78489    6.17   3.28e-06 ***
#   exp1         0.60220    0.04326   13.92 2.18e-12 ***
#   exp2         0.01173    0.02346    0.50    0.622    
#   exp3        -4.16043    0.32004  -13.00 8.43e-12 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.8111 on 22 degrees of freedom
# Multiple R-squared:  0.9469,	Adjusted R-squared:  0.9397 
# F-statistic: 130.8 on 3 and 22 DF,  p-value: 3.551e-14

# Conclusiones:
# Mean rta: 68.60
# Para la primera columna tenemos 4 filas que estudiaremos a continuación:
# La primera fila (Intercept) indica el valor esperado de rta utilizando el valor de la media de exp1, 2 y 3.
# Desde la segunda a la cuarta fila tenemos el gradiente de la ecuación de cada exp.

model.lr2 = lm(data = datos, formula = rta~exp1+exp3)
summary(model.lr2)

# Call:
#   lm(formula = rta ~ exp1 + exp3, data = datos)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1.83742 -0.57356  0.05238  0.44248  1.29768 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 23.50042    3.71137   6.332 1.84e-06 ***
#   exp1         0.60196    0.04254  14.150 7.72e-13 ***
#   exp3        -4.16392    0.31471 -13.231 3.07e-12 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.7977 on 23 degrees of freedom
# Multiple R-squared:  0.9463,	Adjusted R-squared:  0.9417 
# F-statistic: 202.7 on 2 and 23 DF,  p-value: 2.469e-15

f = factor(exp3)
model.lr3 = lm(data = datos, formula = rta~exp1+f)
summary(model.lr3)
