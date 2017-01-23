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
## Setting of parameters
par(mfcol=c(1,1))
## Plot2
plot(epc_feb12$Datetime, epc_feb12$GlobalActivePower,ylab = "Global Active Power (kilowatts)", xlab="", type="l")
## copy my plot to a PNG file
dev.copy(png,file="C:/Sabine/Coursera Exploratory Data Analysis/Assignment 1/plot2.png", width = 480, height = 480)
## close the PNG device
dev.off()