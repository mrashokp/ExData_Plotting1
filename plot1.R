setwd("D:/ACP/Self/Coursera/Exploratory Data Analysis")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power.zip")
file <- unzip("power.zip")
file.size(file)
power <- read.table(file,header=T,sep = ";",na.strings = "?",stringsAsFactors = F)
power <- power[grep("^1/2/2007|^2/2/2007",power[,1]),]
power[,1] <- as.Date(power[,1],format = "%d/%m/%Y")

png(filename = "./ExData_Plotting1/plot1.png",width = 480,height = 480)
hist(power$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
