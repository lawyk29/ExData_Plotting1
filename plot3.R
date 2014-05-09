### Reading and preprocessing data
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                    stringsAsFactors = FALSE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
subpower <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
subpower$DateTime <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- strptime(subpower$DateTime, "%Y-%m-%d %H:%M:%S")

### Plotting energy sub metering
subpower[,7] <- as.numeric(subpower[,7])
subpower[,8] <- as.numeric(subpower[,8])
subpower[,9] <- as.numeric(subpower[,9])
png("plot3.png", bg = "transparent")
plot(subpower[,7], x = subpower[,10], type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(subpower[,8], x = subpower[,10], col = "red")
lines(subpower[,9], x = subpower[,10], col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
