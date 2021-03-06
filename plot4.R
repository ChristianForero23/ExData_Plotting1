datos<- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
datos<- subset(datos,datos$Date=="1/2/2007" | datos$Date=="2/2/2007")
datos$Global_active_power<-as.numeric(datos$Global_active_power)
datetime <- strptime(paste(datos$Date, datos$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
png(file="plot4.png",width=480, height=480)
par(mfcol=c(2,2))
with(datos,{
  plot(datetime, datos$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(datetime, datos$Sub_metering_1 ,type="l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(datetime, datos$Sub_metering_2 ,type="l", xlab="", ylab=" ", col="red")
  lines(datetime, datos$Sub_metering_3 ,type="l", xlab="", ylab=" ", col="blue")
  legend("topright", pch= "-" , col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  plot(datetime, datos$Voltage ,type="l", xlab="Datetime", ylab="Voltaje")
  plot(datetime, datos$Global_reactive_power ,type="l", xlab="datetime")
})
dev.off()

