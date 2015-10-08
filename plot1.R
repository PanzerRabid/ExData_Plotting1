##read, subset, and save it in ds
ds<-read.csv("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F)
ds<-subset(ds,Date== "2/2/2007" | Date== "1/2/2007")

##open a device and plot
png("plot1.png")
hist(as.numeric(ds$Global_active_power),xlab="Global Active Power (kilowatts)",
     breaks=12,col="red",main="Global Active Power")
dev.off()