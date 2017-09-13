library(shiny)

runApp(
  list(
    ui = shinyUI(fluidPage(theme = "bootstrap.css",
                           fluidRow(
                             column(8, align="center", offset = 2,
                                    textInput("string", label="",value = "", width = "100%"),
                                    tags$style(type="text/css", "#string { height: 50px; width: 100%; text-align:center; font-size: 30px; display: block;}")
                             )
                           ),
                           fluidRow(
                             column(6, align="center", offset = 3,
                                    actionButton("button",label = textOutput("prediction")),
                                    tags$style(type='text/css', "#button { vertical-align: middle; height: 50px; width: 100%; font-size: 30px;}")
                             )
                           )
    )
    ), server = shinyServer(function(input, output) {})))
