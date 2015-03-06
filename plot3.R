source("LoadData.R")
hpcdata <- loaddata()
png(filename = "plot3.png", height = 480, width= 480, units = "px")
plot(x=hpcdata$Time, y=hpcdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "", lwd = 1)
lines(x=hpcdata$Time, hpcdata$Sub_metering_2, type="l", col="Red", lwd = 1)
lines(x=hpcdata$Time, hpcdata$Sub_metering_3, type="l", col="Blue", lwd = 1)
legend("topright" , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = c(1,1,1), lty = c(1,1,1))
dev.off()
