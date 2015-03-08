#Read data from Household Power Consumption file
df <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset data frame to 1/2/2007 and 2/2/2007 only
df.short <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007" ),]

#Convert Date and Time columns to a Date/Time class
df.short$DateTime <- strptime(paste(df.short$Date,df.short$Time),"%d/%m/%Y %H:%M:%S")

#Create plot
plot(df.short$DateTime, df.short$Global_active_power,
            type = "n",
            xlab = "",
            ylab = "Global Active Power (kilowatts)")
lines(df.short$DateTime, df.short$Global_active_power)

#Export as png
dev.copy(png, file = "plot2.png", width=480,height=480)
dev.off()