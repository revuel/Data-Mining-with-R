# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE CLIENTE
#   APLICACIÓN: CRIMEN

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

require(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Crímenes"),
  sidebarPanel(
    radioButtons("dist", "Tipo de crimen:",
                 c("Asesinato" = "Murder",
                   "Robo" = "Assault",
                   "Violación" = "Rape"))
  ),
  mainPanel(
    h3(textOutput("Crimen")),
    htmlOutput("gvis")
  )
)
) 