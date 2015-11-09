# Make sure you are in the right path


ds = read.csv('household_power_consumption.txt', colClasses = c('character', 'character', rep('character', 7)), sep = ';')
ds$dateT <- as.Date(ds$Date, "%d/%m/%Y")
tds <- ds[ds$dateT >= as.Date("2007-02-01") & ds$dateT <= as.Date("2007-02-02"),]

tds$gapT <- as.numeric(tds$Global_active_power)
tds$dtT <- strptime(paste(tds$Date, tds$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width = 480,height = 480)
plot(tds$dtT, tds$gapT, type = 'l',xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()