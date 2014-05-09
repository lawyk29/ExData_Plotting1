### Reading and preprocessing data
power <- read.table("household_power_consumption.txt", sep = ";", 
                    dec = ".", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
subpower <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
subpower$DateTime <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- strptime(subpower$DateTime, "%Y-%m-%d %H:%M:%S")

### Plotting panel of four plots
png("plot4.png", bg = "transparent")
par(mfrow = c(2,2))
with(subpower, {
  plot(Global_active_power, x = DateTime, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Voltage, x = DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Sub_metering_1, x = DateTime, type = "l", xlab = "", 
       ylab = "Energy sub metering")
  lines(Sub_metering_2, x = DateTime, col = "red")
  lines(Sub_metering_3, x = DateTime, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power, x = DateTime, type = "l", xlab = "datetime", 
       ylab = "Global_reactive_power")
})
dev.off()
