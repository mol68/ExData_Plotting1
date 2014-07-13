householdcomp<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

indexes<-grep("^1/2/2007|^2/2/2007",householdcomp$Date)
householdcomp_days<-householdcomp[indexes,]

householdcomp_days$Global_active_power<-as.numeric(levels(householdcomp_days$Global_active_power))[householdcomp_days$Global_active_power]

all<-paste(householdcomp_days$Date,householdcomp_days$Time)
Sys.setlocale(category="LC_TIME", locale="English")
householdcomp_days$datetime<-strptime(all, "%d/%m/%Y %H:%M:%S")

with(householdcomp_days, plot(datetime, Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)"))

dev.copy(png,file="plot2.png")
dev.off()




