library(shiny)
fluidPage(
  
  titlePanel("Verifiche su carichi totali"),

  #sidebarLayout(
    #sidebarPanel(
    #  radioButtons("ch",
    #               label="Seleziona tipologia o macchina di prova:",
    #               choices=list("Flessione piani",
    #                            "Aggancio mobili appesi"),
                                #"1753 MOB: fatica sedile e schienale e carico statico",
                                #"1754 MOB: fatica sedile e schienale e carico statico",
                                #"1755 MOB: fatica sedile e schienale e carico statico",
                                #"1867 MOB: fatica sedile e schienale e carico statico (doppia)"),
    #               selected="")
    #),

    mainPanel(
      
      #conditionalPanel(
        #condition = "input.ch=='Flessione piani'",
        #tabsetPanel(
          #tabPanel("MainTab",

      sidebarPanel(
      
        p("Specificare tipologia e numero delle masse che compongono il carico:"),
        textInput("mob977", 
                  "Masse da 1 kg (977 MOB)", 
                  0,#initial value 
                  width="300px"),
        textInput("mob1604", "Masse da 5 kg (1604 MOB)", 0, width="300px"),
        textInput("mob1669", "Masse in sacchetti da 5 kg (1669 MOB)", 0, width="300px"),
        textInput("mob1680", "Masse in dischi da 100 g (1680 MOB)", "n.a.", width="300px"),
        textInput("mob1684", "Masse in dischi da 1 kg (1684 MOB)", "n.a.", width="300px"),
        textInput("mob1685", "Masse in dischi da 5 kg (1685 MOB)", 0, width="300px"),
        textInput("mob1686", "Masse in dischi da 10 kg (1686 MOB)", 0, width="300px"),
        textInput("mob1891", "Masse in sacchetti da 1 kg (1891 MOB)", 0, width="300px"),
        textInput("mob1892", "Masse in sacchetti da 2 kg (1892 MOB)", 0, width="300px")
        ),
      
      mainPanel(
        #p("Specificare il numero di esperimenti virtuali da effettuare:"),
        textInput("Nexp", "Numero di esperimenti virtuali", 100, width="300px"),
        tags$head(tags$script(src = "message-handler.js")),
                   
#                  HTML('<hr style="color: purple;">'),
        actionButton("runsim", "Run simulation",
                     width="300px",
                     style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                   
         plotOutput("Plot", 
                    width = 1100,
                    height = 700, 
                    click = "plot_click")
                   #verbatimTextOutput("info")

        #)
      
      )
    
    
    )
)
