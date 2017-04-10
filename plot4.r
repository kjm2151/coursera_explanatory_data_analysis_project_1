getwd()
data_full <- read.csv(file = "C:/Users/Device Admin/Documents/household_power_consumption.txt",
                      header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


## Subsetting the imported data
names(data_full) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change Data Format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##mfrow – A vector of length 2, 
##where the first argument specifies the number of rows 
##and the second the number of columns of plots.
par(mfrow=c(2,2))


## Plot 4
with(data,{
  plot(data$Time,as.numeric(as.character(data$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(data$Time,as.numeric(as.character(data$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(data,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(data$Time,as.numeric(as.character(data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})


## Output diagram
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
