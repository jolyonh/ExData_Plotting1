setwd("C:/Users/JolyonH/Coursera/Exploratory")
data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt", 
                   sep=";", 
                   stringsAsFactors = FALSE, 
                   header=TRUE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

plotData <- subset(data, Date=="2007-02-02" | Date == "2007-02-01")

plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")



png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(plotData$DateTime, 
     plotData$Global_active_power, 
     xlab = NA,
     ylab = NA,
     type="o", 
     pch=NA)
mtext(side = 2, "Global Active Power", line = 3)
axis(side=1,lwd=2, labels=FALSE)
axis(side=2,lwd=2)

plot(plotData$DateTime, 
     plotData$Voltage, 
     xlab = "datetime",
     ylab = "",
     type="o", 
     pch=NA)
mtext(side = 2, "Voltage", line = 3)
axis(side=1,lwd=2, labels=FALSE)
axis(side=2,lwd=2)

plot(plotData$DateTime, 
     plotData$Sub_metering_1, 
     xlab = NA,
     ylab = NA,
     type="o", 
     pch=NA)
lines(plotData$DateTime, plotData$Sub_metering_2, col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, col="blue")
mtext(side = 2, "Energy sub metering", line = 3)
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1),
       col=c("black","red","blue"))

plot(plotData$DateTime, 
     plotData$Global_reactive_power, 
     xlab = "datetime",
     ylab = NA,
     type="o", 
     pch=NA)
mtext(side = 2, "Global_reactive_power", line = 3)
axis(side=1,lwd=2, labels=FALSE)
axis(side=2,lwd=2)

dev.off()