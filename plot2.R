##read, subset, format the data and save it in ds
ds<-read.csv('household_power_consumption.txt',header=T,sep=';',stringsAsFactors = F)
ds<-subset(ds,Date== '2/2/2007' | Date== '1/2/2007')
ds$Date<-with(ds,paste(Date,Time))
ds$Date<-strptime(ds$Date,format='%d/%m/%Y %H:%M:%S')

##open a device and plot
png('plot2.png')
with(ds,plot(Date,Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type='l'))
dev.off()