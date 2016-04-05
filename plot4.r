#Data preparation
#==================
library(ggplot2)

powercons<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.string="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
powercons<-within(powercons,Date.Time<-as.POSIXlt(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
powerconssub<-subset(powercons,Date.Time>="2007-02-01 00:00:00" & Date.Time<"2007-02-03 00:00:00")
powerconssub$dow<- weekdays(as.Date(powerconssub$Date, "%d/%m/%Y"))


#Plot 4
#==================
par(mfrow=c(2,2))
#1
plot(powerconssub$Date.Time,powerconssub$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")
#2
plot(powerconssub$Date.Time,powerconssub$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")
#3
plot(powerconssub$Date.Time,powerconssub$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(powerconssub$Date.Time,powerconssub$Sub_metering_2,col="red")
lines(powerconssub$Date.Time,powerconssub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black","red","blue"),bty="n")
#4
plot(powerconssub$Date.Time,powerconssub$Global_reactive_power,type = "l",xlab = "datetime",ylab="Global_reactive_power")

dev.copy(png,'plot4.png',width=480, height=480)
dev.off()
