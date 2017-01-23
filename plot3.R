## Assignment 1 for Exploratory Data Analysis
## Use of libraries
library(dplyr)
## Setting language to English
Sys.setlocale("LC_TIME", "English")

## Reading the Electric Power Consumption Data
epc <- read.table("C:/Sabine/Coursera Exploratory Data Analysis/Assignment 1/household_power_consumption/household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE,dec=",")

## Getting all values from dates 2007-02-01 and 2007-02-02
epc_feb12 <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"), ]

##  Create Datetime variable
epc_feb12 <- mutate(epc_feb12, Datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S") )
## Create numeric variable
epc_feb12 <- mutate(epc_feb12, GlobalActivePower = as.numeric(Global_active_power))
## setting of parameters 
par(mfcol=c(1,1))
par(cex=0.7)
## Plot3
plot(epc_feb12$Datetime, epc_feb12$Sub_metering_1,ylab = "Energy sub metering", xlab="", type="l")
points(epc_feb12$Datetime, epc_feb12$Sub_metering_2, col="red",type="l")
points(epc_feb12$Datetime, epc_feb12$Sub_metering_3, col="blue",type="l")
## Legend
legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty= c(1,1), border =FALSE)
## copy my plot to a PNG file
dev.copy(png,file="C:/Sabine/Coursera Exploratory Data Analysis/Assignment 1/plot3.png",width = 480, height = 480)
## close the PNG device
dev.off()