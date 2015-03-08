#Read data from Household Power Consumption file
df <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset data frame to 1/2/2007 and 2/2/2007 only
df.short <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007" ),]

#Convert Date and Time columns to a Date/Time class
df.short$DateTime <- strptime(paste(df.short$Date,df.short$Time),"%d/%m/%Y %H:%M:%S")

#Create plot
plot(df.short$DateTime, df.short$Sub_metering_1,
              type = "n",
              xlab = "",
              ylab = "Energy sub metering")
lines(df.short$DateTime, df.short$Sub_metering_1, col = "Black")
lines(df.short$DateTime, df.short$Sub_metering_2, col = "Red")
lines(df.short$DateTime, df.short$Sub_metering_3 ,col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue")       
       )

#Export as png
dev.copy(png, file = "plot3.png", width=480,height=480)
dev.off()