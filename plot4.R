
# Make sure you are in the right path


ds = read.csv('household_power_consumption.txt', colClasses = c('character', 'character', rep('character', 7)), sep = ';')
ds$dateT <- as.Date(ds$Date, "%d/%m/%Y")
tds <- ds[ds$dateT >= as.Date("2007-02-01") & ds$dateT <= as.Date("2007-02-02"),]

tds$gapT <- as.numeric(tds$Global_active_power)
tds$dtT <- strptime(paste(tds$Date, tds$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width = 480,height = 480)

par(mfrow = c(2,2))

plot(tds$dtT, as.numeric(tds$Global_active_power), type = 'l',xlab = '', ylab = 'Global Active Power')
plot(tds$dtT, as.numeric(tds$Voltage), type = 'l',xlab = 'datetime', ylab = 'Voltage')

plot(tds$dtT, as.numeric(tds$Sub_metering_1), type = 'l',xlab = '', ylab = 'Energy sub metering', col = 'gray', lwd =2)
lines(tds$dtT, as.numeric(tds$Sub_metering_2), col='red')
lines(tds$dtT, as.numeric(tds$Sub_metering_3), col='blue')
legend("topright", lty = 1, col = c("gray", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(tds$dtT, as.numeric(tds$Global_reactive_power), type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
