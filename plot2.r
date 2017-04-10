## Import Raw data into Rstudio
getwd()
data_full <- read.csv(file = "./household_power_consumption.txt",
                      header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


## Subsetting the imported data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change Data Format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

data$Globalactivepowertest <- as.numeric(as.character(data$Global_active_power))


## Plot 2
plot(data$Globalactivepowertest~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Output diagram
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
