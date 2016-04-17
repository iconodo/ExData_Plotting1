
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "gastoElec.zip")

unzip("gastoElec.zip")
              
hpcLines <- readLines("household_power_consumption.txt"),

days_1_2 <- grep("^[12]/2/2007", substr(hpcLines, 1,8))
           
tbl_1_2 <- read.table(text=hpcLines[days_1_2], sep = ";", 
                      stringsAsFactors = FALSE )

var_names = c("Date", "Time", "Global_active_power", 
                            "Global_reactive_power", "Voltage", 
                            "Global_intensity", "Sub_metering_1", 
                            "Sub_metering_2", "Sub_metering_3")

names(tbl_1_2) <- var_names
              

              
with(tbl_1_2, hist(Global_active_power, col = "red", 
                  main = "Global Active Power",
                  xlab = "Global Active Power (kilowatts)" ))
              
