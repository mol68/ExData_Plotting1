householdcomp<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

indexes<-grep("^1/2/2007|^2/2/2007",householdcomp$Date)
householdcomp_days<-householdcomp[indexes,]

householdcomp_days$Global_active_power<-as.numeric(levels(householdcomp_days$Global_active_power))[householdcomp_days$Global_active_power]

with(householdcomp_days, hist(Global_active_power,main="Global active power",col="red",xlab="Global active power (kilowatts)"))

dev.copy(png,file="plot1.png")  
dev.off()