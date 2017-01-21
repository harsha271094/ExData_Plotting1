setwd("E:/EDA with R/coursera")
data<-read.csv("household_power_consumption.txt",sep=';')
dat<-data
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")
dat<-subset(dat,!is.na(dat$Date))

x<-as.POSIXct(paste(dat$Date,dat$Time))
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))
plot(x,y=as.numeric(dat$Global_active_power)/500,ylab="Global Active power(kilowatts)",xlab=" ",type="l")
plot(x,y=as.numeric(dat$Voltage),ylab="Voltage",xlab="datetime",type="l")

plot(x,y=dat$Sub_metering_1,ylab="Energy Sub metering",xlab=" ",type="l")
points(x,y=as.numeric(dat$Sub_metering_2)/5,type="l",col="red")
points(x,y=dat$Sub_metering_3,type="l",col="blue")
legend("topright",pch=0,col=c("black","blue","red"),legend=c("sub-metering_1","sub-metering_2","sub-metering_3"))

plot(x,y=as.numeric(dat$Global_reactive_power)/500,ylab="Global Reactive power(kilowatts)",xlab="datetime",type="l")

dev.off()    

