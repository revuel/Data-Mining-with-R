# ############################################################################## #
#    APRENDIZAJE ESTAD�STICO Y DATA MINING
#    Pr�ctica 1
#    Miguel Revuelta Espinosa
#    DNI: 53624350-B
# ############################################################################## #

# -------- DATASET: IRIS --------

# Comprobamos que efectivamente el dataset iris existe
str(iris)

# Seccionando datos de entrenamiento y de prueba
set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
iris_entrenamiento <- iris[ind==1,]
iris_prueba <- iris[ind==2,]

# --- Librer�a party

# Instalando la librer�a
install.packages("party")

# Incluyendo la libreria en el proyecto
library(party)

# �rbol de clasificaci�n - Creaci�n
iris_ctree <- ctree (Species ~ Sepal.Length + Sepal.Width + 
                       Petal.Length + Petal.Width, data = iris_entrenamiento) 

# �rbol de clasificaci�n - Comprobacion
print(iris_ctree)

# �rbol de clasificaci�n - Dibujo
plot(iris_ctree)


# --- Librer�a Rpart

# Instalando la librer�a
install.packages("rpart")

# Incluyendo la librer�a
library(rpart)

# �rbol de clasificaci�n - Creaci�n
iris_ctree2 <- rpart(Species ~ Sepal.Length + Sepal.Width + 
                       Petal.Length + Petal.Width,method="class", 
                     data=iris_entrenamiento)

# �rbol de clasificaci�n - Comprobacion
printcp(iris_ctree2)

# �rbol de clasificaci�n - Dibujo
plot(iris_ctree2, uniform=TRUE, main="�rbol del dataset iris usando Rpart")
text(iris_ctree2, use.n=TRUE, all=TRUE, cex=.8)

# --- Librer�a Rweka

# Instalando la librer�a
install.packages("RWeka")
install.packages("partykit") # Necesario para le plot

# Incluyendo la librer�a
library(RWeka)

# �rbol de clasificaci�n - Creaci�n
iris_ctree3 <- J48(Species~., data = iris)

# �rbol de clasificaci�n - Comprobacion
print(iris_ctree3)

# �rbol de clasificaci�n - Dibujo
plot(iris_ctree3)

# ------- DATASET: TENIS -------- 
# Importar archivo de valores separados por coma
tenis <- read.csv("K:/Data Mining/Pr�ctica2/tenis.csv", 
                  header=T, dec=".",sep=",")

# Comprobaci�n del tipo de dato en el que ha sido guardado el dataset
typeof(tenis)

# Supervisar que el dataset se ha cargado correctamente
tenis

# Seccionando datos de entrenamiento y de prueba
set.seed(1234)
ind2 <- sample(2, nrow(tenis), replace=TRUE, prob=c(0.7, 0.3))
tenis_entrenamiento <- tenis[ind2==1,]
tenis_prueba <- tenis[ind2==2,]

# Instalando el paquete Formula
install.packages("Formula")

# Incluyendo el paquete Formula
library(Formula)

# --- Librer�a party

# �rbol de decisi�n - Creaci�n
tenis_ctree <- ctree (play ~ outlook + temperature 
                      + humidity + windy, data = tenis_entrenamiento) 

# �rbol de decisi�n - Comprobacion
print(tenis_ctree)

# �rbol de decisi�n - Dibujo
plot(tenis_ctree)

# --- Librer�a Rpart

# �rbol de Decisi�n - Creaci�n
tenis_ctree2 <- rpart(play ~ outlook + temperature + 
                        humidity + windy,method="class", 
                      data=tenis_entrenamiento)

# �rbol de Decisi�n - Comprobaci�n
 printcp(tenis_ctree2)


# �rbol de Decisi�n - Dibujo
# plot(tenis_ctree2, uniform=TRUE)
# text(tenis_ctree2, use.n=TRUE, all=TRUE, cex=.8)
# NOTA: Al ser s�lo una ra�z, no se puede mostrar el �rbol

# --- Librer�a Rweka
# �rbol de clasificaci�n - Creaci�n
tenis_ctree3 <- J48(play~., data = tenis)

# �rbol de clasificaci�n - Comprobacion
# print(tenis_ctree3)
# NOTA: No he conseguido corregir este error a tiempo
# �rbol de clasificaci�n - Dibujo
plot(tenis_ctree3)