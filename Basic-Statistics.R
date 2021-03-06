# ############################################################################## #
#    APRENDIZAJE ESTAD�STICO Y DATA MINING
#    Pr�ctica 1
#    Miguel Revuelta Espinosa
#    DNI: 53624350-B
# ############################################################################## #

# Importar archivo de valores separados por coma
datos <- read.csv("K:/Data Mining/Pr�ctica1/datosExcel.csv", header=T, dec=".",sep=",")

# Comprobaci�n del tipo de dato en el que ha sido guardado el dataset
typeof(datos)

# Supervisar que el dataset se ha cargado correctamente
datos

# Generaci�n del histograma
Histograma.Temperatura.Max <- hist (datos$Temperatura.Max, breaks=c(seq(0,40,2)), col=terrain.colors(10), main="Temperatura M�xima", ylab="Frecuencia", xlab="Intervalos de temperaturas m�ximas", right=FALSE)

# C�lculo de la frecuencia acumulada de la temperatura m�xima
Frecuencia.Acumulada <- cumsum(Histograma.Temperatura.Max$counts)

# C�lculo de la funci�n densidad de la temperatura m�xima
Densidad <- density(datos$Temperatura.Max)

# A�adiendo la funci�n Densidad
lines(x = Densidad$x, y = Densidad$y * length(datos$Temperatura.Max) * diff(Histograma.Temperatura.Max$breaks)[1], lwd = 2, col="red")

# A�adiendo la frecuencia acumulada
lines(x = Densidad$x, y = cumsum(Densidad$y)/max(cumsum(Densidad$y)) * length(datos$Temperatura.Max), lwd = 2, col="blue")

# Incluyendo nueva columna: Temperatura media del d�a
datos$Temperatura.Media.Dia <- (datos$Temperatura.Max + datos$Temperatura.Min) * 0.5

# Previsi�n del caudal
Prevision.caudal <- lm(datos$Caudal ~ datos$Precipitaciones + datos$Velocidad.Viento + datos$Temperatura.Media.Dia );

# Comprobando los coeficientes estimadados para la previsi�n del caudal
Prevision.caudal

# A�adiendo columna con las previsiones de los caudales para cada d�a seg�n los coeficientes obtenidos
datos$Prevision.Caudal <- (57.6680 + 0.6855*datos$Precipitaciones - 0.9774*datos$Velocidad.Viento - 2.0967*datos$Temperatura.Media.Dia)

# Comparaci�n del caudal real con el caudal previsto
datos$Error <- abs(datos$Caudal - datos$Prevision.Caudal)

# C�lculo del valor medio del error
Media.Error <- mean(datos$Error)
Media.Error

# C�lculo de la desviaci�n t�pica del error
Desviacion.Error <- sd(datos$Error)
Desviacion.Error

# A�adiendo una columna que indique la estaci�n
#     Primero llevamos las fechas a un vector auxiliar
fecha = as.Date(datos$Fecha, format="%m/%d/%Y")
#     Tratamos el string de cada coordenada del vector para extraer �nicamente el mes
mes = format(fecha, format="%m")
#     Convertimos el tipo de dato a num�rico
mes <- as.numeric(mes)
#     Recorremos el vector asignando seg�n el valor del indice (n� de mes) un valor a datos$Estaci�n seg�n el �ndice (primaver, verano...)
for (indice in 1:365){ if(mes[indice] == 12 || mes[indice] == 1 || mes[indice] == 2){datos$Estacion[indice] <- "Invierno"}else if (mes[indice] == 3 || mes[indice] == 4 || mes[indice] == 5){datos$Estacion[indice] <- "Primavera"}else if(mes[indice] == 6 || mes[indice] == 7 || mes[indice] == 8){datos$Estacion[indice] <- "Verano"}else{datos$Estacion[indice] <- "Oto�o"} }
