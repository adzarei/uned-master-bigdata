rm(list=ls())
source("TP2/aux_functions.R")

data=read.table("TP2/data/le.txt", header = TRUE)

c_list = read.table("TP2/data/c_num.txt", header=TRUE)

for (c in c_list$num) {
  print(calculate_sano_enf_by_c(c , data, output = "both"))
}
