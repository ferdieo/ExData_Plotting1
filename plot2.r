#Data preparation
#==================
library(ggplot2)

powercons<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.string="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
powercons<-within(powercons,Date.Time<-as.POSIXlt(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
powerconssub<-subset(powercons,Date.Time>="2007-02-01 00:00:00" & Date.Time<"2007-02-03 00:00:00")
powerconssub$dow<- weekdays(as.Date(powerconssub$Date, "%d/%m/%Y"))

#Plot 2
#==================
plot(powerconssub$Date.Time,powerconssub$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,'plot2.png',width=480, height=480)
dev.off()


