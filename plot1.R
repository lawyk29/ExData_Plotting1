### Reading and preprocessing data
power <- read.table("household_power_consumption.txt", sep = ";", headter = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
subpower <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
subpower$DateTime <- paste(subpower$Date, subpower$Time)
subpower$DateTime <- strptime(subpower$DateTime, "%Y-%m-%d %H:%M:%S")

### Plotting histogram of Global Active Power
subpower[,3] <- as.numeric(subpower[,3])
png("plot1.png", bg = "transparent")
hist(subpower[,3], main = "Global Active Power", 
     xlab = "Global Active Power (in kilowatts)", col = "red")
dev.off()
