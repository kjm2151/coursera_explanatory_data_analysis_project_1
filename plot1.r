## Import Raw data into Rstudio
getwd()
data_full <- read.csv(file = "C:/Users/HMF05638/Documents/Coursera2/household_power_consumption.txt",
                      header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


## Subsetting the imported data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change Data Format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

data$Globalactivepowertest <- as.numeric(as.character(data$Global_active_power))


## Plot 1
hist(data$Globalactivepowertest, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Output diagram
dev.copy(png, file="plot1_2.png", height=480, width=480)
dev.off()
