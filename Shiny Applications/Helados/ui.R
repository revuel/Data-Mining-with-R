# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.

#   MIGUEL REVUELTA ESPINOSA
#   PRÁCTICA FINAL DATA MINING
#   FICHERO DE CONFIGURACIÓN DE CLIENTE
#   APLICACIÓN: HELADOS

# ·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.
shinyUI(pageWithSidebar(
  headerPanel("Tabla de Helados"),
  sidebarPanel(
    checkboxInput(inputId = "pageable", label = "Ajustar"),
    conditionalPanel("input.pageable==true",
                     numericInput(inputId = "pagesize",
                                  label = "Número de registros",10))
  ),
  mainPanel(
    htmlOutput("myTable")
  )
)) 
