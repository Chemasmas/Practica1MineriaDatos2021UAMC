##Entorno
filesDir = "textFiles/"
dir.create(filesDir,showWarnings = FALSE)
imgDir = "img/"
dir.create(imgDir,showWarnings = FALSE)

data = read.csv("water.csv")
data2 = read.table("mtcars.txt",header = TRUE)

sumary1 = summary(data)

write.table(sumary1, paste(filesDir,"resumenWaterOrig.txt"), sep="\t")
data$Salnty[is.na(data$Salnty)] = 33.86
data$ï..T_degC[is.na(data$ï..T_degC)] = 10.06

sumary2 = summary(data)
write.table(sumary2, paste(filesDir,"resumenWaterClean.txt"), sep="\t")

sumary3 = summary(data2)
write.table(sumary3, paste(filesDir, "resumenCars.txt"), sep="\t")

data2 = subset(data2, select=c(4,5,7))

sumary4 = summary(data2)
write.table(sumary4, paste(filesDir, "resumenCarsLimpio.txt"), sep="\t")

write.csv(data,"salidaWaterClean.csv")

png(file=paste(imgDir,"bpTemperatura.png"))
boxplot(data$ï..T_degC, main="Temperatura Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpSalinidad.png"))
boxplot(data$Salnty, main="Salinidad Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpHorsepower.png"))
boxplot(data2$hp, main="HorsePower Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpPeso.png"))
boxplot(data2$wt, main="Peso Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"bpDesplazamiento.png"))
boxplot(data2$disp, main="Desplazamiento Boxplot",outcol ="red")
dev.off()

png(file=paste(imgDir,"spWater.png"))
plot(x=data$Salnty, y=data$ï..T_degC, xlab ="Salinidad" , ylab="Temperatura")
dev.off()

png(file=paste(imgDir,"spCarsWhole.png"))
plot(data2)
dev.off()

png(file=paste(imgDir,"spHPvsWT.png"))
plot(x=data2$wt, y=data2$hp, xlab = "Peso" , ylab = "HorsePower")
dev.off()

png(file=paste(imgDir,"spHPvsDISP.png"))
plot(x=data2$disp, y=data2$hp, xlab = "Desplazamiento" , ylab = "HorsePower")
dev.off()