library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",na.strings="\\?",header=TRUE)
data<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
data<-mutate(data,Time=paste(Date,Time,sep=" "))
data$Time<-strptime(data$Time,"%d/%m/%Y %H:%M:%S")
png("plot3.png")
with(data,plot(Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n"))
with(data,{lines(x=Time,y=Sub_metering_1,col="black")
           lines(x=Time,y=Sub_metering_2,col="red")
           lines(x=Time,y=Sub_metering_3,col="blue")})
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()

