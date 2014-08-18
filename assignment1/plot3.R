#!/usr/bin/env Rscript

# Read the dataset.
fn <- "./household_power_consumption.txt"
x <- read.table(fn, sep=";", header=TRUE, na.strings="?")

# Subset of X that is between the two dates of interest.
date_range <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
x$dt = strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
t <- x[as.Date(strptime(x$Date, "%d/%m/%Y")) %in% date_range,]

# plot a histogram to a png output file.
png("plot3.png", width=480, height=480, bg="white")

plot(t$dt, t$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

lines(t$dt, t[["Sub_metering_1"]], col="black")
lines(t$dt, t[["Sub_metering_2"]], col="red")
lines(t$dt, t[["Sub_metering_3"]], col="blue")
legend("topright", legend=v, col=c("black","red","blue"), lty = "solid" )


dev.off()
    
