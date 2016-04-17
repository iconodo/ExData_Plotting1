### 4th plot

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "gastoElec.zip")

unzip("gastoElec.zip")

tbl <-
read.csv(
    "household_power_consumption.txt",
    header = T,
    sep = ';',
    na.strings = "?",
    nrows = 2075259,
    check.names = F,
    stringsAsFactors = F,
    quote = '\"'
)


library(dplyr)

tbl_1_2 <- filter(tbl, Date == "1/2/2007" | Date == "2/2/2007")

rm(tbl)

tbl_1_2[, "Date"] <- as.Date(tbl_1_2[, "Date"], format = "%d/%m/%Y")

tbl_1_2$Datetime <- as.POSIXct(paste(tbl_1_2$Date, tbl_1_2$Time))

par (mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(tbl_1_2, {
     plot(Global_active_power ~ Datetime,
         type = "l", ylab = "Global active power (Kw)",
         xlab = ""
     )
     
     plot(Voltage ~ Datetime,
         type = "l", ylab = "Voltage",
         xlab = "Date and Time"
     )          
     
     plot(Sub_metering_1 ~ Datetime,
         type = "l", ylab = "Energy sub metering",
         xlab = ""
     )          
     
     lines(Sub_metering_2 ~ Datetime, col = "Red")
     lines(Sub_metering_3 ~ Datetime, col = "Blue")
     
     legend("topright", 
           col = c("black", "red", "blue"),
           lty = 1,
           lwd = 2,
           cex=.35,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
     )
     
     plot(Global_reactive_power ~ Datetime,
         type = "l", ylab = "Global reactive power",
         xlab = "Date and time"
     )
})     


