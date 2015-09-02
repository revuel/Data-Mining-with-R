# ############################################################################## #
#    APRENDIZAJE ESTADÍSTICO Y DATA MINING
#    Práctica 1
#    Miguel Revuelta Espinosa
#    DNI: 53624350-B
# ############################################################################## #

# Importar archivo de valores separados por coma
datos <- read.csv("K:/Data Mining/Práctica1/datosExcel.csv", header=T, dec=".",sep=",")

# Comprobación del tipo de dato en el que ha sido guardado el dataset
typeof(datos)

# Supervisar que el dataset se ha cargado correctamente
datos

# Generación del histograma
Histograma.Temperatura.Max <- hist (datos$Temperatura.Max, breaks=c(seq(0,40,2)), col=terrain.colors(10), main="Temperatura Máxima", ylab="Frecuencia", xlab="Intervalos de temperaturas máximas", right=FALSE)

# Cálculo de la frecuencia acumulada de la temperatura máxima
Frecuencia.Acumulada <- cumsum(Histograma.Temperatura.Max$counts)

# Cálculo de la función densidad de la temperatura máxima
Densidad <- density(datos$Temperatura.Max)

# Añadiendo la función Densidad
lines(x = Densidad$x, y = Densidad$y * length(datos$Temperatura.Max) * diff(Histograma.Temperatura.Max$breaks)[1], lwd = 2, col="red")

# Añadiendo la frecuencia acumulada
lines(x = Densidad$x, y = cumsum(Densidad$y)/max(cumsum(Densidad$y)) * length(datos$Temperatura.Max), lwd = 2, col="blue")

# Incluyendo nueva columna: Temperatura media del día
datos$Temperatura.Media.Dia <- (datos$Temperatura.Max + datos$Temperatura.Min) * 0.5

# Previsión del caudal
Prevision.caudal <- lm(datos$Caudal ~ datos$Precipitaciones + datos$Velocidad.Viento + datos$Temperatura.Media.Dia );

# Comprobando los coeficientes estimadados para la previsión del caudal
Prevision.caudal

# Añadiendo columna con las previsiones de los caudales para cada día según los coeficientes obtenidos
datos$Prevision.Caudal <- (57.6680 + 0.6855*datos$Precipitaciones - 0.9774*datos$Velocidad.Viento - 2.0967*datos$Temperatura.Media.Dia)

# Comparación del caudal real con el caudal previsto
datos$Error <- abs(datos$Caudal - datos$Prevision.Caudal)

# Cálculo del valor medio del error
Media.Error <- mean(datos$Error)
Media.Error

# Cálculo de la desviación típica del error
Desviacion.Error <- sd(datos$Error)
Desviacion.Error

# Añadiendo una columna que indique la estación
#     Primero llevamos las fechas a un vector auxiliar
fecha = as.Date(datos$Fecha, format="%m/%d/%Y")
#     Tratamos el string de cada coordenada del vector para extraer únicamente el mes
mes = format(fecha, format="%m")
#     Convertimos el tipo de dato a numérico
mes <- as.numeric(mes)
#     Recorremos el vector asignando según el valor del indice (nº de mes) un valor a datos$Estación según el índice (primaver, verano...)
for (indice in 1:365){ if(mes[indice] == 12 || mes[indice] == 1 || mes[indice] == 2){datos$Estacion[indice] <- "Invierno"}else if (mes[indice] == 3 || mes[indice] == 4 || mes[indice] == 5){datos$Estacion[indice] <- "Primavera"}else if(mes[indice] == 6 || mes[indice] == 7 || mes[indice] == 8){datos$Estacion[indice] <- "Verano"}else{datos$Estacion[indice] <- "Otoño"} }
