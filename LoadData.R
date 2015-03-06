
loaddata <- function(){
        library("tools")
        
        #check to see if the file doesn't exist or doesn't have the correct checksum.  If either is true, download and extract
        filechecksum <- "e05286cd4a257d80c3f0407b350df7dd"
        
        if (!file.exists("household_power_consumption.txt")|md5sum("household_power_consumption.txt") != filechecksum) {
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
        
        hpcdata
}
