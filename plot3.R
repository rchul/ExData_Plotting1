exdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

exdata$Date <- as.Date(exdata$Date, format = "%d/%m/%Y")

exdata$Time <- format(strptime(exdata$Time, "%H:%M:%S"),"%H:%M:%S")

firstd <- subset(exdata, Date == as.Date("2007-02-01"))
secondd <- subset(exdata, Date == as.Date("2007-02-02"))

usedata <- rbind(firstd,secondd)

datetime <- as.POSIXct(paste(usedata$Date,usedata$Time))

#Third One
par(mfcol=c(1,1))
plot(datetime,as.numeric(as.character(usedata$Sub_metering_1)),type="l",ylab = "Energy Sub Metering",xlab= "")
lines(datetime,as.numeric(as.character(usedata$Sub_metering_2)),col="red")
lines(datetime,as.numeric(as.character(usedata$Sub_metering_3)),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png,"plot3.png")
dev.off()