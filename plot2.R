exdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

exdata$Date <- as.Date(exdata$Date, format = "%d/%m/%Y")

exdata$Time <- format(strptime(exdata$Time, "%H:%M:%S"),"%H:%M:%S")

firstd <- subset(exdata, Date == as.Date("2007-02-01"))
secondd <- subset(exdata, Date == as.Date("2007-02-02"))

usedata <- rbind(firstd,secondd)

datetime <- as.POSIXct(paste(usedata$Date,usedata$Time))

#Second One
png("plot2.png")

par(mfcol=c(1,1))

plot(datetime,as.numeric(as.character(usedata$Global_active_power)),type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")

dev.off()