DATA_FILE = "exdata-data-household_power_consumption/household_power_consumption.txt"
PLOT_FILE = "plot2.png"

#check if the file exists
if(!file.exists(DATA_FILE)) {
  stop( sprintf("File Not Found: %", DATA_FILE)
}

#read the data
myDF <- read.csv( DATA_FILE, sep = ";", na.strings="?")

#convert data times
myDF$DateTime <- strptime(paste(myDF$Date, myDF$Time), "%d/%m/%Y %H:%M:%S")

#subset 2 days in Feb
myDFSmall <- myDF[myDF$DateTime > strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & myDF$DateTime < strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"), ]

#plot the graph to pdf
png(filename=PLOT_FILE)
plot(  myDFSmall$DateTime, myDFSmall$Global_active_power, typ="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
