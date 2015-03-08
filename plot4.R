#Read data from Household Power Consumption file
df <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset data frame to 1/2/2007 and 2/2/2007 only
df.short <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007" ),]

#Convert Date and Time columns to a Date/Time class
df.short$DateTime <- strptime(paste(df.short$Date,df.short$Time),"%d/%m/%Y %H:%M:%S")

#Create plot
par(mfcol=c(2,2))
par(mar=c(4, 4, 2, 2))
#Create plot 1 (top left)
plot(df.short$DateTime, df.short$Global_active_power,
     type = "n",
     xlab = "",
     ylab = "Global Active Power"
     )
lines(df.short$DateTime, df.short$Global_active_power)

#Create plot 2 (bottom left)
plot(df.short$DateTime, df.short$Sub_metering_1,
              type = "n",
              xlab = "",
              ylab = "Energy sub metering")
lines(df.short$DateTime, df.short$Sub_metering_1, col = "Black")
lines(df.short$DateTime, df.short$Sub_metering_2, col = "Red")
lines(df.short$DateTime, df.short$Sub_metering_3 ,col = "Blue")
legend("topright", bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue")       
      )

#Create plot 3 (top right)
plot(df.short$DateTime, df.short$Voltage,
     type = "n",
     xlab = "datime",
     ylab = "Voltage"
)
lines(df.short$DateTime, df.short$Voltage)

#Create plot 4 (bottom right)
plot(df.short$DateTime, df.short$Global_reactive_power,
     type = "n",
     xlab = "datime",
     ylab = "Global_reactive_power"
)
lines(df.short$DateTime, df.short$Global_reactive_power)

#Export as png
dev.copy(png, file = "plot4.png", width=480,height=480)
dev.off()