# Set workspace, download source data files

## Set working directory

setwd("C:/Users/bened/Desktop/R/ExplData/week1/")

## Download source data file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,destfile="hhpc.zip")


# Load and clean up the data for analysis and plotting

## Extract and load data into a data.frame

unzip(zipfile="hhpc.zip")

hhpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))


## Format date to Type Date
hhpc$Date<-as.Date(hhpc$Date,"%d/%m/%Y")


## Filter data set from Feb. 1, 2007 to Feb. 2, 2007

hhpc <- subset(hhpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


## Remove incomplete observation

hhpc <- hhpc[complete.cases(hhpc),]



# Merge Date and Time column in one "DateTime" column, remove separate Date and Time columns

## Combine Date and Time in one column

dateTime <- paste(hhpc$Date, hhpc$Time)


## Name the vector

dateTime <- setNames(dateTime, "DateTime")


## Remove Date and Time column

hhpc <- hhpc[ ,!(names(hhpc) %in% c("Date","Time"))]


## Add DateTime column

hhpc <- cbind(dateTime, hhpc)


## Format dateTime Column

hhpc$dateTime <- as.POSIXct(dateTime)


# Plot 1

## Create the histogram

hist(hhpc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save histogram to plot1.png

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


# immediately after plot1.R, please run plot2.R, plot3.R and plot4.R to obtain the respective plots.