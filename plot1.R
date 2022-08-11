

      
library(sqldf)
query_string <- "select * from file where Date =='1/2/2007' OR Date == '2/2/2007'"
print(query_string)
power <- read.csv.sql(file = "/Users/Admin/Downloads/household_power_consumption.txt", sql = query_string,header = TRUE, sep = ";")
head(power)
nrow(power)
png("/Users/Admin/Downloads/plottingFiles/plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", main = "Global_active_power", xlab = "Global_active_power(kilowatts)", ylab = "Frequency")
dev.off()
rm(list = ls(all = TRUE))
