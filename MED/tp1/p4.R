rm(list=ls())
datos=read.table("data_sets/c_d_1.txt", header = TRUE)
attach(datos)

ind1=which(exp==1)
ind2=which(exp==2)

n1=length(rta[ind1])
n2=length(rta[ind2])

tapply(rta,exp,mean)
tapply(rta,exp,sd)

t.test(rta[ind1], rta[ind2], var.equal = TRUE)

exp2 = 1*(exp==2)
exp2

summary(lm(data = datos, formula = rta ~ exp2))

