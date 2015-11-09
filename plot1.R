

# Make sure you are in the right path


ds = read.csv('household_power_consumption.txt', colClasses = c('character', 'character', rep('character', 7)), sep = ';')
ds$dateT <- as.Date(ds$Date, "%d/%m/%Y")
tds <- ds[ds$dateT >= as.Date("2007-02-01") & ds$dateT <= as.Date("2007-02-02"),]

png(filename="plot1.png",width = 480,height = 480)

hist(as.numeric(tds$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()