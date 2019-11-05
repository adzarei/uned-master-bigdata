# Ejercicio 1.1 del tema3.
# Ejemplo de diagnostico dicotomico.

# En origen tenemos 2 variables que siguen el esquema D <- D.
# rta = Y = 1 => El individuo está relamente enfermo.
# exp = X = 1 => La prueba diagnostica indica que el individuo está enfermo.

# Problema:
# Datos los datos d_d_4.txt, se debe calcualr: OR, IC y su significación estadistica.
######################################################################################

# Primero borramos los datos cargados en el contexto de R.
rm(list=ls());

# Cargamos los datos en una tabla.
# Puesto que tiene header (rta exp) se lo indicamos para que se desprecie como dato 
# y se asigne valor a las columnas.
datos = read.table(file = "data/d_d_4.txt", header = TRUE)

# Añadimos 'datos' al path de busqueda de R. Ahora podremos acceder a sus columnas sin mencionar datos.
attach(datos)

# Calculamos los valores de la tabla:
# (Confusion Matrix)
###########################
#       X = 1   X = 0     #
# Y = 1   a       b   r1  #
# Y = 0   c       d   r0  #
#        s1      s0   n   #
###########################

#Lista con los indices en los que exp == 1
ind1 = which(exp == 1)
ind0 = which(exp == 0)
ind11 = which(rta == 1 & exp == 1)
ind10 = which(rta == 1 & exp == 0)

a = length(rta[ind11])
b = length(rta[ind10])
s1 = length(rta[ind1])
s0 = length(rta[ind0])

c = s1 - a
d = s0 - b
r1 = a + b
r0 = c + d

n = a + b + c + d

# Odds Ratio (OR)
# Puesto que el OR es el cociente entre las probabilidades complementarias lo calculamos de la siguiente forma:
OR = (a*d)/(b*c)
# OR = 2.583333
# Como [OR > 1] X es un factor de riesgo. La presencia de X favorece la presencia de Y.

# Indice de Confianza (IC)
# Para calcular IC, necesitamos la E[ln(OR)] y EE[ln(OR)].
# Si queremos utilizar el OR como esperanza, puesto que no sigue una distribución normal, debemos usar ln(OR).
# En el caso del error estandar, bastará con aplicar la sqrt(varianza).
# No nos debemos de olvidar de deshacer el ln en el resultado final del IC con exp(resultado).
# Para calcular el IC al 95% usamos alfa = 0.05
#
# IC(95%) = E[ln(OR)] +- z(1-0.05/2) * EE[ln(OR)]
# E[ln(OR)]  = ln(OR)
# EE[ln(OR)] = sqrt(1/a + 1/b + 1/c + 1/d)

alpha = 0.05

ee = sqrt(1/a + 1/b + 1/c + 1/d)
# En R, log(X) == ln(X)
e = log(OR)exp

IC95_1 = exp(log(OR) - qnorm(1-alpha/2)*ee)
IC95_2 = exp(log(OR) + qnorm(1-alpha/2)*ee)
#IC95 = (1.014507, 6.57818)

tabla = table(-rta, -exp)
chisq.test(tabla, correct = FALSE)
#p-value = 0.04175

# Conclusión:
# Puesto que el P-Value < alpha, rechazamos la hipotesis nula. 
# Esto quiere decir que SI que existe correlación significativa, Y <- X (X si que explica Y).
# Dado que el OR > 1, la correlacion que existe es positiva.
# Por lo tanto, se puede concluir que la prueba diagnostica X es fiable.
