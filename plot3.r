# 1. Leer el archivo completo, leyendo encabezados y convirtiendo tipos
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# 2. Filtrar los datos solo para los días requeridos
dias <- c("1/2/2007", "2/2/2007")
data_filtrada <- subset(data, Date %in% dias)

# 3. Unir la columna de fecha y hora, y convertirla en tipo POSIXlt
data_filtrada$DateTime <- strptime(paste(data_filtrada$Date, data_filtrada$Time), format = "%d/%m/%Y %H:%M:%S")

# 4. Graficar los datos
png(filename = "plot3.png", width = 480, height = 480)
plot(data_filtrada$DateTime, data_filtrada$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_filtrada$DateTime, data_filtrada$Sub_metering_2, col = "red")
lines(data_filtrada$DateTime, data_filtrada$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()