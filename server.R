source("get_sim_frame.R")

function(input, output, session) {

  output$Plot <- renderPlot({

    if (input$runsim == 0)
      return()

    #input$runsim
    nexps <- strtoi(isolate(input$Nexp))
    masses977 <- strtoi(isolate(input$mob977))
    masses1604 <- strtoi(isolate(input$mob1604))
    masses1669 <- strtoi(isolate(input$mob1669))

    #write function that makes the randon etract and chart. Takes 4 ints as input.
    df_res <- get_sim_frame(masses977,
                            masses1604,
                            masses1669,
                            nexps)
    #3 istogrammi per i valori medie delle tre estrazioni ---> df_res contiene solo i risultati degli esperimenti
    #sarebbe bello far vedere l'istogramma di tutte le masse con in sovra impressione quello delle masse estratte
    #impossibile dovresti avere 3*nexp istogrammi... 
      
    #grafico che mostra le incertezze di misura delle masse estratte
    
    plot(df_res$ep_n,
         1e-3*df_res$meas_wgt,
         pch=20,
         col="darkblue",
         xlim=c(1,nexps),
         ylim=c(1e-3*mean(df_res$ref_wgt) - 1e-3*0.5*0.015*(df_res$ref_wgt[1]),
                1e-3*mean(df_res$ref_wgt) + 1e-3*0.5*0.015*(df_res$ref_wgt[1])),
         bty="n",
         #axes="F",
         xlab = "n° esperimento virtuale",
         ylab = "Carico totale [kg]")
    
    arrows(df_res$ep_n, 
           1e-3*df_res$meas_wgt - 1e-3*df_res$meas_unc, 
           df_res$ep_n, 
           1e-3*df_res$meas_wgt + 1e-3*df_res$meas_unc, 
           length=0.05, 
           angle=90, 
           code=3)
    
    abline(h=1e-3*df_res$ref_wgt[1] + 1e-3*0.5*0.01*(df_res$ref_wgt[1]),
           col="red",
           lty=2)
    abline(h=1e-3*df_res$ref_wgt[1] - 1e-3*0.5*0.01*(df_res$ref_wgt[1]),
           col="red",
           lty=2)
    
    n977 <- length(df_977$ref)
    n1604 <- length(df_1604$ref)
    n1669 <- length(df_1669$ref)
    
    
    frac_of_tot <- round(100*nexps/(choose(n977,n1) + choose(n1604,n2) + choose(n1669,n3)),6)
    par(mar=c(0, 0, 0, 0))
    legend("topright",
           c(paste(as.character(frac_of_tot),"%")),
           bty="n")
    })

}

