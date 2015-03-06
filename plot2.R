#This script requires the "tools" package to check the md5sum to validate the the file hasn't been modified.
library("tools")

#check to see if the file doesn't exist in the working directory or doesn't have the correct checksum.  
#If either is true, download and extract the file and procede to load it
if (!file.exists("household_power_consumption.txt")|md5sum("household_power_consumption.txt") != "e05286cd4a257d80c3f0407b350df7dd") {
  # download the file and unzip it.
  message("downloading file")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip")
  unzip("exdata_data_household_power_consumption.zip", files = "household_power_consumption.txt")
} else {
  message("checksum matches - using existing file")
}

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
hpcdata <- hpc[hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007",]
hpcdata$Time <- strptime(paste(hpcdata$Date, hpcdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
hpcdata$Date <- as.Date(hpcdata$Date, "%d/%m/%Y")
remove(hpc)

png(filename = "plot2.png", height = 480, width= 480, units = "px")
plot(x=hpcdata$Time, y=hpcdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()

remove(hpcdata)