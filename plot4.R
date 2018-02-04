library(lubridate)
library(ggplot2)
AllData <- read.table("household_power_consumption.txt", header = TRUE , sep = ";")
Feb2007Days2 <- subset(AllData, dmy(AllData$Date) == dmy("01-02-2007") | dmy(AllData$Date) == dmy("02-02-2007"))
rm(AllData)

Feb2007Days2$Sub_metering_1 <- as.numeric(as.character(Feb2007Days2$Sub_metering_1))
Feb2007Days2$Sub_metering_2 <- as.numeric(as.character(Feb2007Days2$Sub_metering_2))
Feb2007Days2$Sub_metering_3 <- as.numeric(as.character(Feb2007Days2$Sub_metering_3))
Feb2007Days2$Global_active_power <- as.numeric(as.character(Feb2007Days2$Global_active_power))
Feb2007Days2$Global_reactive_power <- as.numeric(as.character(Feb2007Days2$Global_reactive_power))
Feb2007Days2$Voltage <- as.numeric(as.character(Feb2007Days2$Voltage))


Feb2007Days2$Date <- dmy(Feb2007Days2$Date)

DateTime <- paste(Feb2007Days2$Date, Feb2007Days2$Time)
DateTime <-strptime(DateTime, "%Y-%m-%d %H:%M:%S")

par(mfcol = c(2,2))
plot(DateTime,Feb2007Days2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")


plot(DateTime,Feb2007Days2$Sub_metering_1, col ="black" ,type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime,Feb2007Days2$Sub_metering_2, col ="red" ,type = "l")
lines(DateTime,Feb2007Days2$Sub_metering_3, col ="blue" ,type = "l")
legend("topright",cex = .5,bty = "n",y.intersp=.6, lty =1, col = c("black","red","blue" ), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DateTime,Feb2007Days2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(DateTime,Feb2007Days2$Global_reactive_power , type = "l",xlab = "datetime",  ylab = "Global_ractive_power")

dev.copy(png, file = "plot4.png")
dev.off()