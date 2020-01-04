calculate_sano_enf_by_c <- function(c, table_data=read.table("TP2/data/le.txt",header = TRUE), output="both"){
  ind.enf=which(table_data$rta==1)
  ind.sano=which(table_data$rta==0)
  
  table_data.enf=table_data$exp[ind.enf]
  table_data.sano=table_data$exp[ind.sano]
  
  res.enf=length(which(table_data.enf > c))
  res.sano=length(which(table_data.sano < c))
  
  switch (output,
    both = {
      print(paste(res.sano, ",",res.enf))
      
    },
    enf = {
      print(paste(res.enf))
      
    },
    sano = {
      print(paste(res.sano))
      
    }
  )
}
