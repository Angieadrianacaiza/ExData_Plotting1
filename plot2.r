# plot2 Mejorado

# Leer el archivo completo (asegúrate de que household_power_consumption.txt esté en tu directorio de trabajo)
data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=TRUE, 
                   na.strings="?",
                   stringsAsFactors=FALSE)

# Filtrar datos solo para los días requeridos
data_filtrada <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Crear columna de fecha y hora en formato POSIXlt
data_filtrada$DT <- strptime(paste(data_filtrada$Date, data_filtrada$Time), format="%d/%m/%Y %H:%M:%S")

# Graficar
png(filename = "plot2.png", width = 480, height = 480)
plot(data_filtrada$DT, data_filtrada$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()