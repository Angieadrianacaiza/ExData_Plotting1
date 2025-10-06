
#plot1 
# Leer las primeras líneas del archivo para ver el formato
lines <- readLines("household_power_consumption.txt", n = 10)
print(lines)
# Leer todas las líneas del archivo
lines <- readLines("household_power_consumption.txt")

# Encontrar las líneas correspondientes a los días de interés
start_line <- grep("^1/2/2007", lines)[1] # Primer día
end_line <- tail(grep("^2/2/2007", lines), 1) # Última línea del segundo día

# Calcular el número de filas a leer
num_rows <- end_line - start_line + 1

# Mostrar los resultados para verificar
cat("Primera línea de interés:", start_line, "\n")
cat("Última línea de interés:", end_line, "\n")
cat("Total de filas a leer:", num_rows, "\n")

# Leer solo las filas de los días deseados
d <- read.table("household_power_consumption.txt",
                sep = ";",
                skip = start_line - 1, # Saltar líneas hasta el primer día
                nrows = num_rows,
                na.strings = "?",
                header = FALSE)

# Renombrar las columnas manualmente (ya que saltamos el encabezado)
colnames(d) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# crear y Guardar el  histograma
png("plot1.png", width = 480, height = 480, units = "px")
hist(d$Global_active_power, 
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()