datos<- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
datos<- subset(datos,datos$Date=="1/2/2007" | datos$Date=="2/2/2007")
datos$Global_active_power<-as.numeric(datos$Global_active_power)
datetime <- strptime(paste(datos$Date, datos$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(file="plot2.png",width=480, height=480)
plot(datetime, datos$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
