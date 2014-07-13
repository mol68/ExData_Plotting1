householdcomp<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

indexes<-grep("^1/2/2007|^2/2/2007",householdcomp$Date)
householdcomp_days<-householdcomp[indexes,]

householdcomp_days$Sub_metering_1<-as.numeric(levels(householdcomp_days$Sub_metering_1))[householdcomp_days$Sub_metering_1]
householdcomp_days$Sub_metering_2<-as.numeric(levels(householdcomp_days$Sub_metering_2))[householdcomp_days$Sub_metering_2]

all<-paste(householdcomp_days$Date,householdcomp_days$Time)
Sys.setlocale(category="LC_TIME", locale="English")
householdcomp_days$datetime<-strptime(all, "%d/%m/%Y %H:%M:%S")


with(householdcomp_days, {
	plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(datetime,Sub_metering_2,type="l",col=2)
	lines(datetime,Sub_metering_3,type="l",col=4)
	legend("topright", legend=names(householdcomp_days)[7:9],cex=0.7,y.intersp=0.6,text.width=strwidth(names(householdcomp_days)[7]),lty=1, lwd=1, col=c(1,2,4))
	})
dev.copy(png,file="plot3.png")
dev.off()