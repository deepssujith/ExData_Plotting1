library(sqldf)
query_string <- "select * from file where Date =='1/2/2007' OR Date == '2/2/2007'"
print(query_string)
power <- read.csv.sql(file = "/Users/Admin/Downloads/household_power_consumption.txt", sql = query_string,header = TRUE, sep = ";")
head(power)
nrow(power)
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("/Users/Admin/Downloads/plottingFiles/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(datetime,power$Global_active_power,type = 'l', col = "red", ylab = "Global_active_power")
plot(datetime,power$Voltage, type = 'l', col = "blue",ylab = "Voltage")
with(power, plot(datetime,Sub_metering_1,type = 'n',ylab = "Energy metering")) 
     points(datetime,power$Sub_metering_1,type = 'l', col = "red")
     points(datetime,power$Sub_metering_2, type = 'l', col = "blue")
     points(datetime,power$Sub_metering_3, type = 'l', col = "green")
plot(datetime,power$Global_reactive_power, type = 'l', col = "green", ylab = "Global_reactive_power")


#png("/Users/Admin/Downloads/plottingFiles/plot4.png", width = 480, height = 480)
#dev.copy(png, "/Users/Admin/Downloads/plottingFiles/plot4.png")

dev.off()
rm(list = ls(all = TRUE))
