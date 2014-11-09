data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt", 
                   sep=";", 
                   stringsAsFactors = FALSE, 
                   header=TRUE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

plotData <- subset(data, Date=="2007-02-02" | Date == "2007-02-01")

plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot3.png", width=480, height=480)
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
dev.off()
