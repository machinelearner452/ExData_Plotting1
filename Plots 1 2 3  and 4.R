##  Introduction - Exploratory Data Analysis Plotting Assignment 
##  This assignment was done in one file vs the suggested four.
   
##  This assignment uses data from
##  the "http://archive.ics.uci.edu/ml/" UC Irvine Machine
##  Learning Repository</a>, a popular repository for machine learning
##  datasets. In particular, we will be using the "Individual household
##  electric power consumption Data Set" which I have made available on
##  the course web site:

##  We will only be using data from the dates 2007-02-01 and
##  2007-02-02. One alternative is to read the data from just those dates
##  rather than reading in the entire dataset and subsetting to those
##  dates.
   
##  You may find it useful to convert the Date and Time variables to
##  Date/Time classes in R using the `strptime()` and `as.Date()`
##  functions.
   
##  Note that in this dataset missing values are coded as `?`.

library(data.table)
library(ggplot2)

##  set working directory
setwd("C:/Users/Joe/Documents/Coursera/Johns Hopkins University/Exploratory Data Analysis/")

##  if data file not create  - create it
if(!file.exists("household_power_consumption.zip"))
  {   file.create("household_power_consumption.zip")
    filecsv <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(filecsv,destfile="./household_power_consumption.zip")
    
    ## record the download date of the zip file
    dateDownloadzip <- date()
  }


## Unzip household_power_consumption.zip to Exploratory Data Analysis/ directory
if (!file.exists("household_power_consumption")) 
  { 
    unzip(zipfile="./household_power_consumption.zip",exdir="./data")
  }

## subsetting data to ensure that we use only data required for February 1 and 2
electricity <- read.table("./data/household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") ##read data files
dataplott<- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007") 

dt <- data.table(dataplott)

     ## Making Plots
     
##   For each plot you should
   
##   Construct the plot and save it to a PNG file with a width of 480
##   pixels and a height of 480 pixels.
   
##   Name each of the plot files as `plot1.png`, `plot2.png`, etc.
   
##   Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
##   constructs the corresponding plot, i.e. code in `plot1.R` constructs
##   the `plot1.png` plot. Your code file **should include code for reading
##   the data** so that the plot can be fully reproduced. You should also
##   include the code that creates the PNG file.
   
##   Add the PNG file and R code file to your git repository
##   There should be four PNG files and four R code files.
   

     ### Plot 1

globalActivePower <- as.numeric(dt$Global_active_power)
  png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

     ### Plot 2
     
## str(subSetData)
datetime <- strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dt$Global_active_power)
  png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

     ### Plot 3
     
## str(subSetData)
datetime <- strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dt$Global_active_power)
subMetering1 <- as.numeric(dt$Sub_metering_1)
subMetering2 <- as.numeric(dt$Sub_metering_2)
subMetering3 <- as.numeric(dt$Sub_metering_3)
  png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 

   
     ### Plot 4
     
## str(subSetData)
datetime <- strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dt$Global_active_power)
globalReactivePower <- as.numeric(dt$Global_reactive_power)
voltage <- as.numeric(dt$Voltage)
subMetering1 <- as.numeric(dt$Sub_metering_1)
subMetering2 <- as.numeric(dt$Sub_metering_2)
subMetering3 <- as.numeric(dt$Sub_metering_3)


  png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

  plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()