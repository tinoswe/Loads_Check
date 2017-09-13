source("load_all_data.R")

get_sim_frame <- function(n1, n2, n3, n4, n5, n6, n7, nexp){
  
  df_result <- data.frame(ep_n=integer(), 
                          ref_wgt=double(),
                          meas_wgt=double(),
                          meas_unc=double())
  
  i <- 1
  for (n in 1:nexp){
    
    df_sub_977 <- df_977[sample(nrow(df_977), n1), ]
    df_sub_1604 <- df_1604[sample(nrow(df_1604), n2), ]
    df_sub_1669 <- df_1669[sample(nrow(df_1669), n3), ]
    df_sub_1685 <- df_1685[sample(nrow(df_1685), n4), ]
    df_sub_1686 <- df_1686[sample(nrow(df_1686), n5), ]
    df_sub_1891 <- df_1891[sample(nrow(df_1891), n6), ]
    df_sub_1892 <- df_1892[sample(nrow(df_1892), n7), ]
    
    df_sub_tot <- rbind(df_sub_977,
                        df_sub_1604)
    df_sub_tot <- rbind(df_sub_tot, 
                        df_sub_1669)
    df_sub_tot <- rbind(df_sub_tot, 
                        df_sub_1685)
    df_sub_tot <- rbind(df_sub_tot, 
                        df_sub_1686)
    df_sub_tot <- rbind(df_sub_tot, 
                        df_sub_1891)
    df_sub_tot <- rbind(df_sub_tot, 
                        df_sub_1892)
    
    df_result[i,] <-c(i,
                      sum(df_sub_tot$ref),
                      sum(df_sub_tot$wgt),
                      2.*sum(0.5*df_sub_tot$uk2))
    
    i <- i+1
  }
  
  return(df_result)
}
