df<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
data<-df[df$Date>=as.Date("2007-02-01",format="%Y-%m-%d") & df$Date<=as.Date("2007-02-02",format="%Y-%m-%d"),]
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frquency")
dev.copy(png,file="plot1.png")
dev.off()