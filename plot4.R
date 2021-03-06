setwd("D:/ACP/Self/Coursera/Exploratory Data Analysis")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power.zip")
file <- unzip("power.zip")
file.size(file)
power <- read.table(file,header=T,sep = ";",na.strings = "?",stringsAsFactors = F)
power <- power[grep("^1/2/2007|^2/2/2007",power[,1]),]
power[,1] <- as.Date(power[,1],format = "%d/%m/%Y")

datetime <- strptime(paste(power$Date,power$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(filename = "./ExData_Plotting1/plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(datetime,power$Global_active_power,type="l", xlab="", ylab = "Global Active Power", cex=0.2)
plot(datetime,power$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
plot(datetime,power$Sub_metering_1,type = "l", ylab = "Energy Submetering", xlab="")
lines(datetime,power$Sub_metering_2,type = "l", col="red")
lines(datetime,power$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=,lwd=2.5, col = c("black","red","blue"),bty = "o")
plot(datetime,power$Global_reactive_power,type="l", xlab = "datetime",ylab="Global_reactive_power")
dev.off()
