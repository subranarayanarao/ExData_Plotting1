setwd ("c:/datascience")

powerconsumption <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")

power2007feb <- powerconsumption[which(powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007"),]

power2007feb$DateTime <- strptime(paste(power2007feb$Date, power2007feb$Time), "%d/%m/%Y %H:%M:%S")

power2007feb$Date <- as.Date(power2007feb$Date, "%d/%m/%Y")

png ("plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(power2007feb$DateTime, power2007feb$Sub_metering_1, type = "l", col="black", xlab = "", ylab = "Energy Sub metering")
lines(power2007feb$DateTime, power2007feb$Sub_metering_2, col = "red")
lines(power2007feb$DateTime, power2007feb$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()


