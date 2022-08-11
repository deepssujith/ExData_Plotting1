library(sqldf)
query_string <- "select * from file where Date =='1/2/2007' OR Date == '2/2/2007'"
print(query_string)
power <- read.csv.sql(file = "/Users/Admin/Downloads/household_power_consumption.txt", sql = query_string,header = TRUE, sep = ";")
head(power)
nrow(power)
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("/Users/Admin/Downloads/plottingFiles/plot3.png", width = 480, height = 480)
with(power, plot(datetime,Sub_metering_1,type = 'n',ylab = "Energy sub metering"))
points(datetime,power$Sub_metering_1,type = 'l', col = "red")
points(datetime,power$Sub_metering_2, type = 'l', col = "blue")
points(datetime,power$Sub_metering_3, type = 'l', col = "green")


#png("/Users/Admin/Downloads/plottingFiles/plot2.png", width = 480, height = 480)
#dev.copy(png, "/Users/Admin/Downloads/plottingFiles/plot3.png")

dev.off()
rm(list = ls(all = TRUE))
