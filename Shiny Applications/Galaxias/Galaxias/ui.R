# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE CLIENTE
#   APLICACIÓN: GALAXIAS

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

library(shiny)
library(ggplot2)
library("MASS")


# Aplicación que grafica un histograma
shinyUI(fluidPage(
  
  # Título
  titlePanel("Velocidades de galaxias"),
  
  # Slider
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Conjuntos ~:",
                  min = 2,
                  max = 18,
                  value = 9)
    ),
    
    # Mostrar
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

