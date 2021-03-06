plot_data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=FALSE)
plot_data_filtered=plot_data[plot_data$Date %in% c("1/2/2007","2/2/2007"), ]
globalActivePower<-as.numeric(plot_data_filtered$Global_active_power)
globarReactivePower<-as.numeric(plot_data_filtered$Global_reactive_power)
voltage<-as.numeric(plot_data_filtered$Voltage)
date_time<-strptime(paste(plot_data_filtered$Date,plot_data_filtered$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")
subMetering1<-as.numeric(plot_data_filtered$Sub_metering_1)
subMetering2<-as.numeric(plot_data_filtered$Sub_metering_2)
subMetering3<-as.numeric(plot_data_filtered$Sub_metering_3)
png("plot4.png",width=480,height=480)
par(mfrow = c(2, 2))
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
