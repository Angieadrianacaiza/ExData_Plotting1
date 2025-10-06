#plot4

# Lee todos los datos
data_full <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Filtra solo las fechas requeridas
data <- subset(data_full, Date == "1/2/2007" | Date == "2/2/2007")

# Crea columna de fecha y hora combinada
data$DT <- paste(data$Date, data$Time)
data$DT1 <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")

# Inicia dispositivo gráfico
png(filename="plot4.png", width=480, height=480)
on.exit(dev.off()) # asegura cerrar el dispositivo

par(mfrow=c(2,2))
par(mar=c(5,4,4,4))

# 1er gráfico
plot(data$DT1, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 2do gráfico
plot(data$DT1, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3er gráfico
plot(data$DT1, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$DT1, data$Sub_metering_1, col="black")
lines(data$DT1, data$Sub_metering_2, col="red")
lines(data$DT1, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# 4to gráfico
plot(data$DT1, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
