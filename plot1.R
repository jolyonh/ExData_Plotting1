data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt", 
                   sep=";", 
                   stringsAsFactors = FALSE, 
                   header=TRUE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

plotData <- subset(data, Date=="2007-02-02" | Date == "2007-02-01")

png(filename="plot1.png"width=480, height=480)
hist(as.numeric(plotData$Global_active_power), 
     xlab = NA,
     ylab = NA,
     main="Global Active Power", 
     col="red",
     lim=c(0,1200))
mtext(side = 1, "Global Active Power (kilowatts)", line = 3, cex=1)
mtext(side = 2, "Frequency", line = 3)
dev.off()

