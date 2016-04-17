### 2nd plot


fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "gastoElec.zip")
              
unzip("gastoElec.zip")

tbl <- read.csv("household_power_consumption.txt", header = T,
               sep = ';', na.strings = "?", nrows = 2075259,
               check.names = F, stringsAsFactors = F,
               quote = '\"')
              
library(dplyr)
              
tbl_1_2 <- filter(tbl, Date == "1/2/2007" | Date == "2/2/2007")
rm(tbl)
              
tbl_1_2[, "Date"] <- as.Date(tbl_1_2[, "Date"], format = "%d/%m/%Y")

tbl_1_2$Datetime <- as.POSIXct(paste(tbl_1_2$Date, tbl_1_2$Time))

plot(tbl_1_2$Global_active_power ~ tbl_1_2$Datetime, type = "l",
    ylab = "Global Active Power (kilowatts)", xlab = "")


