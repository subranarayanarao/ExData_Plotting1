setwd ("c:/datascience")

powerconsumption <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")

power2007feb <- powerconsumption[which(powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007"),]

power2007feb$DateTime <- strptime(paste(power2007feb$Date, power2007feb$Time), "%d/%m/%Y %H:%M:%S")

power2007feb$Date <- as.Date(power2007feb$Date, "%d/%m/%Y")

png ("plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(power2007feb$Global_active_power, col = "Red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")

dev.off()

