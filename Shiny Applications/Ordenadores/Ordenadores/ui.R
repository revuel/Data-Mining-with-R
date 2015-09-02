# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE CLIENTE
#   APLICACIÓN: ORDENADORES

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

library(Ecdat)

com <- Computers
com$screen <- NULL
com$cd <- NULL
com$multi <- NULL
com$premium <- NULL
com$ads <- NULL
com$trend <- NULL

shinyUI(pageWithSidebar(
  headerPanel('Clúster de Ordenadores (486)'),
  sidebarPanel(
    selectInput('ycol', 'Y Variable', names(com)),
    selectInput('xcol', 'X Variable', names(com),
                selected=names(com)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
  )
))
