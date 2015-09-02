# ############################################################################## #
#    APRENDIZAJE ESTADÍSTICO Y DATA MINING
#    Práctica 1
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

# --- Librería party

# Instalando la librería
install.packages("party")

# Incluyendo la libreria en el proyecto
library(party)

# Árbol de clasificación - Creación
iris_ctree <- ctree (Species ~ Sepal.Length + Sepal.Width + 
                       Petal.Length + Petal.Width, data = iris_entrenamiento) 

# Árbol de clasificación - Comprobacion
print(iris_ctree)

# Árbol de clasificación - Dibujo
plot(iris_ctree)


# --- Librería Rpart

# Instalando la librería
install.packages("rpart")

# Incluyendo la librería
library(rpart)

# Árbol de clasificación - Creación
iris_ctree2 <- rpart(Species ~ Sepal.Length + Sepal.Width + 
                       Petal.Length + Petal.Width,method="class", 
                     data=iris_entrenamiento)

# Árbol de clasificación - Comprobacion
printcp(iris_ctree2)

# Árbol de clasificación - Dibujo
plot(iris_ctree2, uniform=TRUE, main="Árbol del dataset iris usando Rpart")
text(iris_ctree2, use.n=TRUE, all=TRUE, cex=.8)

# --- Librería Rweka

# Instalando la librería
install.packages("RWeka")
install.packages("partykit") # Necesario para le plot

# Incluyendo la librería
library(RWeka)

# Árbol de clasificación - Creación
iris_ctree3 <- J48(Species~., data = iris)

# Árbol de clasificación - Comprobacion
print(iris_ctree3)

# Árbol de clasificación - Dibujo
plot(iris_ctree3)

# ------- DATASET: TENIS -------- 
# Importar archivo de valores separados por coma
tenis <- read.csv("K:/Data Mining/Práctica2/tenis.csv", 
                  header=T, dec=".",sep=",")

# Comprobación del tipo de dato en el que ha sido guardado el dataset
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

# --- Librería party

# Árbol de decisión - Creación
tenis_ctree <- ctree (play ~ outlook + temperature 
                      + humidity + windy, data = tenis_entrenamiento) 

# Árbol de decisión - Comprobacion
print(tenis_ctree)

# Árbol de decisión - Dibujo
plot(tenis_ctree)

# --- Librería Rpart

# Árbol de Decisión - Creación
tenis_ctree2 <- rpart(play ~ outlook + temperature + 
                        humidity + windy,method="class", 
                      data=tenis_entrenamiento)

# Árbol de Decisión - Comprobación
 printcp(tenis_ctree2)


# Árbol de Decisión - Dibujo
# plot(tenis_ctree2, uniform=TRUE)
# text(tenis_ctree2, use.n=TRUE, all=TRUE, cex=.8)
# NOTA: Al ser sólo una raíz, no se puede mostrar el árbol

# --- Librería Rweka
# Árbol de clasificación - Creación
tenis_ctree3 <- J48(play~., data = tenis)

# Árbol de clasificación - Comprobacion
# print(tenis_ctree3)
# NOTA: No he conseguido corregir este error a tiempo
# Árbol de clasificación - Dibujo
plot(tenis_ctree3)