source("LoadData.R")
hpcdata <- loaddata()
png(filename = "plot4.png", height = 480, width= 480, units = "px")
par(mfrow = c(2,2))
with(hpcdata,{
        plot(x=Time, y=Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
        plot(x=hpcdata$Time, y=hpcdata$Voltage, type="l", ylab="Voltage", xlab = "datetime")
        plot(x=Time, y=Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "", lwd = 1)
        lines(x=Time, y=Sub_metering_2, type="l", col="Red", lwd = 1)
        lines(x=Time, y=Sub_metering_3, type="l", col="Blue", lwd = 1)
        legend("topright" , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lwd = c(1,1,1), lty = c(1,1,1), bty="n")
        plot(x=hpcdata$Time, y=hpcdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")
        
})
dev.off()