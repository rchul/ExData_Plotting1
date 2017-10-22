exdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

exdata$Date <- as.Date(exdata$Date, format = "%d/%m/%Y")

exdata$Time <- format(strptime(exdata$Time, "%H:%M:%S"),"%H:%M:%S")

firstd <- subset(exdata, Date == as.Date("2007-02-01"))
secondd <- subset(exdata, Date == as.Date("2007-02-02"))

usedata <- rbind(firstd,secondd)

datetime <- as.POSIXct(paste(usedata$Date,usedata$Time))

#First One
par(mfcol=c(1,1))
hist(as.numeric(as.character(usedata$Global_active_power)),freq = TRUE,col="red",
     xlab="Global Active Power(kilowatts)",main = "Global Active Power")

dev.copy(png,"plot1.png")
dev.off()