##Entorno
dataDir <- "data"
filesDir <- "textFiles"
imgDir <- "img"
dir.create(filesDir,showWarnings = FALSE)

dir.create(imgDir,showWarnings = FALSE)

data <- read.csv( paste(dataDir,"water.csv",sep = "/") ,header = TRUE)
data2 <- read.table( paste(dataDir,"mtcars.txt",sep = "/"), header = TRUE)

sumary1 <- summary(data)

write.table(sumary1, paste(filesDir,"resumenWater.txt",sep = "/"), sep="\t")
data$Salnty[is.na(data$Salnty)] = 33.86
data$T_degC[is.na(data$T_degC)] = 10.06

sumary2 <- summary(data)
write.table(sumary2, paste(filesDir,"resumenWaterLimpio.txt",sep = "/"), sep="\t")

sumary3 <- summary(data2)
write.table(sumary3, paste(filesDir, "resumenCars.txt",sep = "/"), sep="\t")

data2 <- subset(data2, select=c(4, 5, 7))

sumary4 <- summary(data2)
write.table(sumary4, paste(filesDir, "resumenCarsLimpio.txt",sep = "/"), sep="\t")

write.csv(data,paste(dataDir,"salidaWaterClean.csv", sep = "/") )

png(file=paste(imgDir,"bpTemperatura.png",sep = "/"))
boxplot(data$T_degC, main="Temperatura Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpSalinidad.png",sep = "/"))
boxplot(data$Salnty, main="Salinidad Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpHorsepower.png",sep = "/"))
boxplot(data2$hp, main="HorsePower Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpPeso.png",sep = "/"))
boxplot(data2$wt, main="Peso Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpDesplazamiento.png",sep = "/"))
boxplot(data2$disp, main="Desplazamiento Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"spWater.png",sep = "/"))
plot(x=data$Salnty, y=data$T_degC, xlab ="Salinidad" , ylab="Temperatura")
dev.off()

png(file=paste(imgDir,"spCarsWhole.png",sep = "/"))
plot(data2)
dev.off()

png(file=paste(imgDir,"spHPvsWT.png",sep = "/"))
plot(x=data2$wt, y=data2$hp, xlab = "Peso" , ylab = "HorsePower")
dev.off()

png(file=paste(imgDir,"spHPvsDISP.png",sep = "/"))
plot(x=data2$disp, y=data2$hp, xlab = "Desplazamiento" , ylab = "HorsePower")
dev.off()