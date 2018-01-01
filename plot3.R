setwd("C:\\Coursera_Data\\Course4\\Course4_Week1\\Course4_Week1_Assignment")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl")
unzip (zipfile = "exdata%2Fdata%2Fhousehold_power_consumption.zip")

file <- read.table("household_power_consumption.txt", sep=";",header = TRUE,na.strings="?")
file$DateFmt <- as.Date(file$Date ,format="%d/%m/%Y")

file$DateTimeFmt <-  as.POSIXct(paste(file$Date,file$Time,  sep = " "),format="%d/%m/%Y %H:%M:%S")
fileSub <- subset(file, DateTimeFmt >= "2007-02-01"  & DateTimeFmt < "2007-02-03" )
fileSub$Global_active_power_kw <-  as.numeric(fileSub$Global_active_power)/1000
#Plot
par(mar = c(2,4,1,1))
with(fileSub, plot(DateTimeFmt,Sub_metering_1,  type = "n", ylab = "Energy sub metering" ) )
with(fileSub, points(DateTimeFmt,Sub_metering_1, col = "black" , type = "l" ) )
with(fileSub, points(DateTimeFmt,Sub_metering_2, col = "red" , type = "l") )
with(fileSub, points(DateTimeFmt,Sub_metering_3, col = "blue" , type = "l") )
legend("topright",pch="-", lwd = "4" , col = c("black","red","blue"), legend  = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()