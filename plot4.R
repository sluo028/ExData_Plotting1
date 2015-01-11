#reading data into R:
data<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Creat a subset of  data from the dates 2007-02-01 and 2007-02-02
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

#Creat new column in dataset named "DateTime"
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))
attach(sub)


# Creat the plot4 image:
png("plot4.png", width = 480, height = 480,units = "px", bg = "transparent")
par(mfcol=c(2,2))

plot(DateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(DateTime, sub$Sub_metering_2, type="l", col="red")
lines(DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(DateTime,as.numeric(as.character(Global_active_power)),type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()
