setwd("C:\\Coursera_Data\\Course4\\Course4_Week1\\Course4_Week1_Assignment")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl")

unzip (zipfile = "exdata%2Fdata%2Fhousehold_power_consumption.zip")

file <- read.table("household_power_consumption.txt", sep=";",header = TRUE,na.strings="?")

file$DateTimeFmt <-  as.POSIXct(paste(file$Date,file$Time,  sep = " "),format="%d/%m/%Y %H:%M:%S")
fileSub <- subset(file, DateTimeFmt >= "2007-02-01"  & DateTimeFmt < "2007-02-03" )
fileSub$Global_active_power_kw <-  as.numeric(fileSub$Global_active_power)/1000
# Plot
par(mar = rep(2))
plot(fileSub$DateTimeFmt,fileSub$Global_active_power_kw,type = 'l' ,ylab = "Global Active Power (kilowatts)"  ,xlab = ""    )

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()