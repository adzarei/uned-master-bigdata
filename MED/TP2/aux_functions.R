calculate_sano_enf_by_c <- function(c, table_data, output="both"){
  ind.enf=which(table_data$rta==1)
  ind.sano=which(table_data$rta==0)
  
  table_data.enf=table_data$exp[ind.enf]
  table_data.sano=table_data$exp[ind.sano]
  
  res.enf=length(which(table_data.enf > c))
  res.sano=length(which(table_data.sano < c))
  
  # Options: both, sano or enf.
  switch (output,
    both = {
      paste(res.sano, ",",res.enf)
      
    },
    enf = {
      res.enf
      
    },
    sano = {
     res.sano
      
    }
  )
}


calculate_ffp <- function(c, r0=33, table_data){
  calculate_ffp.sano=calculate_sano_enf_by_c(c, table_data, "sano")
  return((r0 - calculate_ffp.sano) / r0)
}


calculate_fvp <- function(c, r1=20, table_data){
  calculate_fvp.sano = calculate_sano_enf_by_c(c, table_data, "enf")
  return(calculate_fvp.sano / r1)
}

calculate_trapezoidal_auc <- function(){
  
  
}


