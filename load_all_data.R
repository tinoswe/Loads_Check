#Load all csv files from the same folder. File name is the 4D equipment ID.
#file format: ref, wgt, uk2
#Then use shiny to select 4D equipment name and automatically.

#kept <- 50

#977 MOB: masse da 1 kg
df_977 <- read.csv(file="WGT_Files/977_MOB.txt",
               sep="\t",
               stringsAsFactors = FALSE,
               header=TRUE,
               dec = ",")
df_977 <- df_977[order(df_977$uk2,
                 decreasing=TRUE),]
#df_977 <- head(df_977, 
#               kept)

#consider only the first 100 masses in decreasing uncertainty, from larger to smaller


#1604 MOB: masse da 5 kg
df_1604 <- read.csv(file="WGT_Files/1604_MOB.txt",
               sep="\t",
               stringsAsFactors = FALSE,
               header=TRUE,
               dec = ",")
df_1604 <- df_1604[order(df_1604$uk2,
                       decreasing=TRUE),]
#df_1604 <- head(df_1604, 
#                kept)


#1669 MOB: masse da 1 kg
df_1669 <- read.csv(file="WGT_Files/1669_MOB.txt",
               sep="\t",
               stringsAsFactors = FALSE,
               header=TRUE,
               dec = ",")
df_1669 <- df_1669[order(df_1669$uk2,
                         decreasing=TRUE),]
#df_1669 <- head(df_1669, 
#                kept)


df_1685 <- read.csv(file="WGT_Files/1685_MOB.txt",
                    sep="\t",
                    stringsAsFactors = FALSE,
                    header=TRUE,
                    dec = ",")
df_1685 <- df_1685[order(df_1685$uk2,
                         decreasing=TRUE),]

df_1686 <- read.csv(file="WGT_Files/1686_MOB.txt",
                    sep="\t",
                    stringsAsFactors = FALSE,
                    header=TRUE,
                    dec = ",")
df_1686 <- df_1686[order(df_1686$uk2,
                         decreasing=TRUE),]

df_1891 <- read.csv(file="WGT_Files/1891_MOB.txt",
                    sep="\t",
                    stringsAsFactors = FALSE,
                    header=TRUE,
                    dec = ",")
df_1891 <- df_1891[order(df_1891$uk2,
                         decreasing=TRUE),]

df_1892 <- read.csv(file="WGT_Files/1892_MOB.txt",
                    sep="\t",
                    stringsAsFactors = FALSE,
                    header=TRUE,
                    dec = ",")
df_1892 <- df_1892[order(df_1892$uk2,
                         decreasing=TRUE),]

# length(df$wgt)
# 
# N_experiments <- 1e2
# N_masses <- 80
# 
# df_result <- data.frame(ep_n=integer(), 
#                         ref_wgt=double(),
#                         meas_wgt=double(),
#                         meas_unc=double())
# 
# i <- 1
# for (n_exp in 1:N_experiments){
# 
#   df_sub <- df[sample(nrow(df), N_masses), ]
#   df_result[i,] <-c(i,
#                     sum(df_sub$ref),
#                     sum(df_sub$wgt),
#                     2.*sum(0.5*df_sub$uk2))
#   
#   i <- i+1
# }
# 
# plot(df_result$ep_n,
#      df_result$meas_wgt,
#      pch=20,
#      col="darkblue",
#      ylim=c(mean(df_result$ref_wgt) - 75*sd(df_result$meas_wgt),
#             mean(df_result$ref_wgt) + 75*sd(df_result$meas_wgt)))
# abline(h=df_result$ref_wgt[1] + 0.01*0.5*df_result$ref_wgt[1],
#        col="red",
#        lty=2)
# abline(h=df_result$ref_wgt[1] - 0.01*0.5*df_result$ref_wgt[1],
#        col="red",
#        lty=2)
