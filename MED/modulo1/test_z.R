#Delete all objects from the workspace.
rm(list = ls())

#Load data from file with header.
datos = read.table('data/d_d_1.txt', header = T)

#Create Table obect with the data in 'datos' - 1
#We use attach to bind the header with the column
attach(datos)
tabla = table(-rta,exp)

#Use to detach the attached variables.
#detach(datos)

#Create Table obect with the data in 'datos' - 2
#We use $ to acces a given column.
tabla = table(-datos$rta,datos$exp)

#Finds elements in vector that fulfill condition. 
ind1 = which(exp == 1)
ind2 = which(exp == 2)
ind11 = which(rta == 1 & exp == 1)
ind12 = which(rta == 1 & exp == 2)

a1 = length(rta[ind11])
a2 = length(rta[ind12])
n1 = length(rta[ind1])
n2 = length(rta[ind2])

#IC (95%) -> alfa = 0.5.
alfa = 0.05
pi1 = a1/n1
pi2 = a2/n2

#Standard Error.
ee = sqrt(pi1*(1-pi1)*(1/n1) + pi2*(1-pi2)*(1/n2))

#IC -
ic1 = pi1 - pi2 - qnorm(1-alfa/2)*ee
#IC +
ic2 = pi1 - pi2 + qnorm(1-alfa/2)*ee

pit = (a1+a2)/(n1+n2)
ee0 = sqrt(pit*(1-pit)*(1/n1+1/n2))

z = (pi1-pi2)/ee0

p_valor = 2*(1-pnorm(abs(z)))

#Alternative way to calculate.
a = c(a1,a2)
n = c(n1,n2)
prop.test(a,n,correct = F)
