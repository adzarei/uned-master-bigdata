rm(list=ls())
datos=read.table("data_sets/c_n_1.txt",header=T) 
attach(datos)
ind1=which(exp==1);
ind2=which(exp==2);
ind3=which(exp==3); 
n1=length(rta[ind1]); n1 
n2=length(rta[ind2]); n2 
n3=length(rta[ind3]); n3 
tapply(rta,exp,mean); 
tapply(rta,exp,sd) 
summary(aov(rta~factor(exp)))


exp2=1*(exp==2)
exp3=1*(exp==3)
summary(lm(data=datos, formula=rta ~ exp2+exp3))
