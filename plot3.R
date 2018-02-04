library(lubridate)
library(ggplot2)
AllData <- read.table("household_power_consumption.txt", header = TRUE , sep = ";")
Feb2007Days2 <- subset(AllData, dmy(AllData$Date) == dmy("01-02-2007") | dmy(AllData$Date) == dmy("02-02-2007"))
rm(AllData)

Feb2007Days2$Sub_metering_1 <- as.numeric(as.character(Feb2007Days2$Sub_metering_1))
Feb2007Days2$Sub_metering_2 <- as.numeric(as.character(Feb2007Days2$Sub_metering_2))
Feb2007Days2$Sub_metering_3 <- as.numeric(as.character(Feb2007Days2$Sub_metering_3))

Feb2007Days2$Date <- dmy(Feb2007Days2$Date)

DateTime <- paste(Feb2007Days2$Date, Feb2007Days2$Time)
DateTime <-strptime(DateTime, "%Y-%m-%d %H:%M:%S")

par(mfcol = c(1,1))
plot(DateTime,Feb2007Days2$Sub_metering_1, col ="black" ,type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime,Feb2007Days2$Sub_metering_2, col ="red" ,type = "l")
lines(DateTime,Feb2007Days2$Sub_metering_3, col ="blue" ,type = "l")
legend("topright", lty =1, y.intersp=.6,col = c("black","red","blue" ), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()