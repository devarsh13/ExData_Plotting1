df<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
data<-df[df$Date>=as.Date("2007-02-01",format="%Y-%m-%d") & df$Date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
    plot(Sub_metering_1 ~ Datetime, type = "l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()