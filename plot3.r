#Data preparation
#==================
library(ggplot2)

powercons<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.string="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
powercons<-within(powercons,Date.Time<-as.POSIXlt(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
powerconssub<-subset(powercons,Date.Time>="2007-02-01 00:00:00" & Date.Time<"2007-02-03 00:00:00")
powerconssub$dow<- weekdays(as.Date(powerconssub$Date, "%d/%m/%Y"))

#Plot 3
#==================
plot(powerconssub$Date.Time,powerconssub$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(powerconssub$Date.Time,powerconssub$Sub_metering_2,col="red")
lines(powerconssub$Date.Time,powerconssub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black","red","blue"))
dev.copy(png,'plot3.png',width=480, height=480)
dev.off()


