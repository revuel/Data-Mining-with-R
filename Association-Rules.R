# ############################################################################## #
#    APRENDIZAJE ESTAD�STICO Y DATA MINING
#    Pr�ctica 3
#    Miguel Revuelta Espinosa
#    DNI: 53624350-B
# ############################################################################## #

# # -- 1) PREPARACIONES PREVIAS

# Importar archivo de valores separados por coma
datos <- read.csv("J:/Data Mining/Pr�ctica3/bank-data.csv", header=T, 
                  dec=".",sep=",")

# Comprobaci�n del tipo de dato en el que ha sido guardado el dataset
typeof(datos)

# Supervisar que el dataset se ha cargado correctamente
datos

# # -- 2) PREPROCESAMIENTO

# Comprobaci�n del tipo de dato de la variable age
typeof(datos$age) # Tipo entero, no necesita cambios
typeof(datos$income) # Tipo doble, hay que discretizar

# Eliminar el atributo ID
datos$id <- NULL

# Convirtiendo a entero el valor del income (discretizar)
datos$income <- as.integer(datos$income)

# Convirtiendo en factores
datos$age <- as.factor(datos$age)
datos$income <- as.factor(datos$income)
datos$children <- as.factor(datos$children)

# # -- 3) USANDO ARULES

# Instalaci�n e importacion

install.packages("arules")
library(arules)

# Cron�metro...
crono <- proc.time()

# # -- 3A) apriori
reglas.arules.ap <- apriori(datos)

# Cron�metro
proc.time() - crono
crono <- NULL

# Comprobando resultados

# instalando arulesWiz
install.packages("arulesViz")
library(arulesViz)

# Gr�fico
plot(reglas.arules.ap)

# Inspecci�n
inspect(reglas.arules.ap)

# Ordenando y determinando mejores reglas
reglas.arules.ap.ord <- sort(reglas.arules.ap, by="lift")

inspect(reglas.arules.ap.ord[1:5])

# # -- 3B) eclat
crono2 <- proc.time()

reglas.arules.ec <- eclat(datos)

proc.time() - crono2

# Inspecci�n
inspect(reglas.arules.ec)

# Gr�ficos
reglas.arules.ec.ord <- head(reglas.arules.ec, 10)

plot(reglas.arules.ec.ord)

# # -- 4) USANDO RWeka

# Instalaci�n e importacion

install.packages("RWeka")
library(RWeka)

# # -- 4A) Apriori

crono3 <- proc.time()

reglas.rweka.ap <- Apriori(datos)

proc.time() - crono3

# Nos quedamos con 5 reglas (las mejores en teoria)
reglas.rweka.ap.min <- Apriori(datos, Weka_control(N = 5))

# # -- 4B) Tertius

# Importando el paquete tertius...
#install.packages("Tertius")
#library(Tertius)
# package 'tertius' is not available (for R version 3.0.2) Warning obtenido.

# Lo siguiente habr�a sido invocar ese m�todo o funci�n
# crono4 <- proc.time()
# reglas.rweka.ter <- Tertius(datos) # gen�rico
# proc.time() - crono4

# inspect(reglas.rweka.ter)
# plot(reglas.rweka.ter[1..5])