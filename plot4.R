householdcomp<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

indexes<-grep("^1/2/2007|^2/2/2007",householdcomp$Date)
householdcomp_days<-householdcomp[indexes,]

householdcomp_days$Global_active_power<-as.numeric(levels(householdcomp_days$Global_active_power))[householdcomp_days$Global_active_power]
householdcomp_days$Sub_metering_1<-as.numeric(levels(householdcomp_days$Sub_metering_1))[householdcomp_days$Sub_metering_1]
householdcomp_days$Sub_metering_2<-as.numeric(levels(householdcomp_days$Sub_metering_2))[householdcomp_days$Sub_metering_2]
householdcomp_days$Global_reactive_power<-as.numeric(levels(householdcomp_days$Global_reactive_power))[householdcomp_days$Global_reactive_power]


all<-paste(householdcomp_days$Date,householdcomp_days$Time)
Sys.setlocale(category="LC_TIME", locale="English")
householdcomp_days$datetime<-strptime(all, "%d/%m/%Y %H:%M:%S")


par(mfrow = c(2, 2))
with(householdcomp_days, {
plot(datetime, Global_active_power,type="l",xlab="",ylab="Global active power")
plot(datetime, Voltage,type="l")
	{
	plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(datetime,Sub_metering_2,type="l",col=2)
	lines(datetime,Sub_metering_3,type="l",col=4)
	legend("topright", legend=names(householdcomp_days)[7:9],bty="n",cex=0.5,y.intersp=0.2,inset = c(0.1,-0.1),lty=1, lwd=1, col=c(1,2,4))
	}
plot(datetime, Global_reactive_power,type="l")
})
dev.copy(png,file="plot4.png")
dev.off()
par(mfrow = c(1, 1))