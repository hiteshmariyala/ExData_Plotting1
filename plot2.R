plot_data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=FALSE)
plot_data_filtered=plot_data[plot_data$Date %in% c("1/2/2007","2/2/2007"), ]
globalActivePower<-as.numeric(plot_data_filtered$Global_active_power)
date_time<-strptime(paste(plot_data_filtered$Date,plot_data_filtered$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(date_time,globalActivePower,xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
