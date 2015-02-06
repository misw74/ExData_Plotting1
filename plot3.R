DATA_FILE = "exdata-data-household_power_consumption/household_power_consumption.txt"
PLOT_FILE = "plot3.png"

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
plot(  myDFSmall$DateTime, myDFSmall$Sub_metering_1, typ="l", ylab="Energy sub metering", xlab="")
#lines( DF1$DateTime, DF1$Sub_metering_1, col="black")
lines( myDFSmall$DateTime, myDFSmall$Sub_metering_2, col="red")
lines( myDFSmall$DateTime, myDFSmall$Sub_metering_3, col="blue")
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), col=c("black", "blue", "red"))
dev.off()
