library(shiny)
fluidPage(
  titlePanel("Verifiche su carichi totali"),

  sidebarLayout(

    sidebarPanel(

      radioButtons("ch",
                   label="Seleziona tipologia o macchina di prova:",
                   choices=list("Flessione piani",
                                "Aggancio mobili appesi"),
                                #"1753 MOB: fatica sedile e schienale e carico statico",
                                #"1754 MOB: fatica sedile e schienale e carico statico",
                                #"1755 MOB: fatica sedile e schienale e carico statico",
                                #"1867 MOB: fatica sedile e schienale e carico statico (doppia)"),
                   selected="")
    ),

    mainPanel(
      
      conditionalPanel(
        condition = "input.ch=='Flessione piani'",
        #tabsetPanel(
        #  tabPanel("Flessione piani",
                     p("Specificare tipologia e numero delle masse che compongono il carico:"),
                #splitLayout(
                   textInput("mob977", "Masse da 1 kg (977 MOB)", 0, width="300px"),
                 textInput("mob1604", "Masse da 5 kg (1604 MOB)", 0, width="300px"),
                   textInput("mob1669", "Masse in sacchetti da 5 kg (1669 MOB)", 0, width="300px"),
                  #)
                   br(),
                   p("Specificare il numero di esperimenti virtuali da effettuare:"),
                   textInput("Nexp", "Numero di esperimenti virtuali", 100, width="300px"),
                   tags$head(tags$script(src = "message-handler.js")),
                   actionButton("runsim", "Run simulation",
                                width="300px",
                                style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                   HTML('<hr style="color: purple;">'),
                   
                   plotOutput("Plot", 
                              width = 1000,
                              height = 350)

        )
      
      )
    
    
    )
)
