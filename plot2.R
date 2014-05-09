### Reading and preprocessing data
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
subpower <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
subpower$DateTime <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- strptime(subpower$DateTime, "%Y-%m-%d %H:%M:%S")

### Plotting Global Active Power by time
subpower[,3] <- as.numeric(subpower[,3])
png("plot2.png", bg = "transparent")
plot(subpower[,3], x = subpower[,10], type = "l", xlab = "", 
     ylab = "Global Active Power (in kilowatts)")
dev.off()
