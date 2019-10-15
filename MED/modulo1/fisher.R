rm(list = ls())

#From experiment data.
datos = read.table('data/d_d_2.txt', header = T)
attach(datos)
table = table(rta,exp)

fisher.test(x=table, alternative = "two.sided")

#From MATRIX.
rm(list = ls())
data  = matrix(c(16,21,4,1), ncol = 2, byrow = TRUE)
colnames(data) = c("exp=1","exp=2")
rownames(data) = c("rta=0","rta=1")

table = as.table(data)

fisher.test(x = table, alternative = "two.sided")

#From MATRIX - Ordering as textbook example.
rm(list = ls())
data  = matrix(c(4,1,16,21), ncol = 2, byrow = TRUE)
colnames(data) = c("exp=1","exp=2")
rownames(data) = c("rta=1","rta=0")

table = as.table(data)

fisher.test(x = table, alternative = "two.sided")
