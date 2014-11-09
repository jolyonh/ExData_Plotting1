data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt", 
                   sep=";", 
                   stringsAsFactors = FALSE, 
                   header=TRUE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

plotData <- subset(data, Date=="2007-02-02" | Date == "2007-02-01")

plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(plotData$DateTime, 
     plotData$Global_active_power, 
     xlab = NA,
     ylab = NA,
     type="o", 
     pch=NA)
mtext(side = 2, "Global Active Power (kilowatts)", line = 3)
axis(side=1,lwd=2, labels=FALSE)
axis(side=2,lwd=2)
dev.off()


