setwd("E:/EDA with R/coursera")
data<-read.csv("household_power_consumption.txt",sep=';')
dat<-data
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")
dat<-subset(dat,!is.na(dat$Date))

x<-as.POSIXct(paste(dat$Date,dat$Time))
png(file="plot2.png",width=480,height=480)
plot(x,y=as.numeric(dat$Global_active_power)/500,ylab="Global Active power(kilowatts)",xlab=" ",type="l")
dev.off()    

