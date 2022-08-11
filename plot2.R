library(sqldf)
query_string <- "select * from file where Date =='1/2/2007' OR Date == '2/2/2007'"
print(query_string)
power <- read.csv.sql(file = "/Users/Admin/Downloads/household_power_consumption.txt", sql = query_string,header = TRUE, sep = ";")
head(power)
nrow(power)
png("/Users/Admin/Downloads/plottingFiles/plot2.png", width = 480, height = 480)
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime,power$Global_active_power,type = 'l',ylab = "Global_active_power(kilowatts)")

#png("/Users/Admin/Downloads/plottingFiles/plot2.png", width = 480, height = 480)
#dev.copy(png, "/Users/Admin/Downloads/plottingFiles/plot2.png")

dev.off()
rm(list = ls(all = TRUE))
