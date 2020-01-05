rm(list=ls())
source("TP2/aux_functions.R")

data=read.table("data/le.txt", header = TRUE)

c_list = read.table("data/c_num.txt", header=TRUE)

# Columna Sano & Enf
for (c in c_list$num) {
  print(calculate_sano_enf_by_c(c , data, output = "both"))
}

# Columna ffp(c)
for (c in c_list$num) {
  print(round(calculate_ffp(c = c , table_data = data), digits = 3))
}

# Columna fvp(c)
for (c in c_list$num) {
  print(round(calculate_fvp(c = c , table_data = data), digits = 3))
}

# Curva ROC AUC:

library(pROC)

roc_obj <- roc(data$rta, data$exp)
auc(roc_obj)
# Area under the curve: 0.725
plot(roc_obj, print.auc=TRUE)
