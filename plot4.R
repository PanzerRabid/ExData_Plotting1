##read, subset, format the data and save it in ds
ds<-read.csv('household_power_consumption.txt',header=T,sep=';',stringsAsFactors = F)
ds<-subset(ds,Date== '2/2/2007' | Date== '1/2/2007')
ds$Date<-with(ds,paste(Date,Time))
ds$Date<-strptime(ds$Date,format='%d/%m/%Y %H:%M:%S')

##open a png device and set the frame to 2*2
png('plot4.png')
par(mfrow=c(2,2))

##code for plot1 and plot2
with(ds,plot(Date,Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type='l'))
with(ds,plot(Date,Voltage,xlab='datetime',ylab='Voltage',type='l'))

##code for plot3
with(ds,plot(Date,Sub_metering_1,type="n",xlab='',ylab='Energy sub metering'))
with(ds,points(Date,Sub_metering_1,type="l"))
with(ds,points(Date,Sub_metering_2,type="l",col="red"))
with(ds,points(Date,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(2,2,2),col=c("black","blue","red"))

##code for plot4
with(ds,plot(Date,Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l'))

dev.off()
