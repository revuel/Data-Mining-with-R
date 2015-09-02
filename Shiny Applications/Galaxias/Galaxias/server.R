# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE SERVIDOR
#   APLICACIÓN: GALAXIAS

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.


library(shiny)
library(ggplot2)
library("MASS")

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    
    # pintar el histograma
    hist(galaxies, breaks = input$bins, col = c(heat.colors(10, alpha = 1)), 
         border = 'white', main = "Galaxias", 
         xlab = "Velocidad Km/s", ylab="Frecuencia", right="TRUE")
  })
})

