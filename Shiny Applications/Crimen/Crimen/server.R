# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE RSTUDIO LOCAL

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

require(googleVis)
require(shiny)

library(RCurl)

dat <- USArrests
dat$state <- state.name

shinyServer(function(input, output) {
  
  tipocrimen <- reactive({
    input$dist
  })
  
  output$crimen <- renderText({
    paste("Frecuencia de crímenes:", tipocrimen())
  })
  
  output$gvis <- renderGvis({
  
    gvisGeoChart(dat,
                 locationvar="state", colorvar= tipocrimen(),
                 options=list(region="US", displayMode="regions",
                              resolution="provinces",
                              width=500, height=400,
                              colorAxis="{colors:['#FFFFFF', '#FF0000']}"
                 ))
  })
}) 