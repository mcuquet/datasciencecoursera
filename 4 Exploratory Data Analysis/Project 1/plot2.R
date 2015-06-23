## Parameters
inputPath = "./"
inputFileName = "household_power_consumption.txt"
outputPath = "./"
outputFileName = "plot2.png"

## Set locale to get English (US) dates and times
Sys.setlocale("LC_TIME", "en_US")

## Read data
data <- read.table(paste(inputPath, inputFileName, sep = ""), header = TRUE,
                   sep = ";", na.strings = "?",
                   colClasses = c(rep("character", 2), rep("numeric", 7)),
                   nrows = 2075260)

## Convert Date and Time to Date/Time classes
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset data for dates 2007-02-01 and -02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

# Plot Global active power
png(filename = paste(outputPath, outputFileName, sep = ""),
    width = 480, height = 480, units = "px")
plot(data$Time, data$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)")
dev.off()