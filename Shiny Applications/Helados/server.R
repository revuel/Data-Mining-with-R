# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE SERVIDOR
#   APLICACIÓN: HELADOS

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

## Diego de Castillo, February 2013
library(Ecdat)
library(googleVis)
library(shiny)

shinyServer(function(input, output) {
  opciones <- reactive({
    list(
      page=ifelse(input$pageable==TRUE,'enable','disable'),
      pageSize=input$pagesize,
      width=550
    )
  })
  output$myTable <- renderGvis({
    gvisTable(Icecream,options=opciones())
  })
}) 

