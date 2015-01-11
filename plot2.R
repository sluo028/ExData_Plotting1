#reading data into R:
data<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Creat a subset of  data from the dates 2007-02-01 and 2007-02-02
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

#Creat new column in dataset named "DateTime"
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))
attach(sub)

# Creat the plot2 image:
png("plot2.png", width = 480, height = 480,units = "px", bg = "transparent")
plot(DateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
