#!/usr/bin/env Rscript

# Read the dataset.
fn <- "./household_power_consumption.txt"
x <- read.table(fn, sep=";", header=TRUE, na.strings="?")

# Subset of X that is between the two dates of interest.
date_range <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
x$dt = strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
t <- x[as.Date(strptime(x$Date, "%d/%m/%Y")) %in% date_range,]

# plot a histogram to a png output file.
png("plot2.png", width=480, height=480, bg="white")
hist(t$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
plot(t, t$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
    
