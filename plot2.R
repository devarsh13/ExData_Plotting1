df<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
data<-df[df$Date>=as.Date("2007-02-01",format="%Y-%m-%d") & df$Date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,file="plot2.png")
dev.off()