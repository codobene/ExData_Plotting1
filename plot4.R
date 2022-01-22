# Plot 4, to be run AFTER plot1.R (and plot2.R and plot3.R)

## Create a 2 by 2 panel

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Plot the data

 with(hhpc, {plot(Global_active_power~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
   plot(Voltage~dateTime, type="l", ylab="Voltage (volt)", xlab="")
   plot(Sub_metering_1~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
   lines(Sub_metering_2~dateTime,col='Red')
   lines(Sub_metering_3~dateTime,col='Blue')
   legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   plot(Global_reactive_power~dateTime, type="l", ylab="Global Reactive Power (kilowatts)",xlab="")
 })

dev.copy(png,"plot4.png", width=480, height=480)

dev.off()