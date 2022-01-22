# Plot 2, to be run AFTER plot1.R

plot(hhpc$Global_active_power~hhpc$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)

dev.off()