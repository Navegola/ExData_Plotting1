
## Plot 4


library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "English")  ## Output day of the week in English

## Create a data frame tbl
consumption<-tbl_df(read.delim2("data/household_power_consumption.txt", header = TRUE,sep = ";",dec = ".", na.strings = "?"))

consumption$Date_Time<- paste(consumption$Date, consumption$Time) ## Concatenate Strings Date and Time
consumption$Date_Time<-dmy_hms(consumption$Date_Time) ## Paq lubridate. Parse dates that have hours, minutes, or seconds elements


## Paq. dplyr & lubridate.  Filter for 2007-02-01 and 2007-02-02
consumption2 <- filter(consumption,year(consumption$Date_Time) == 2007 & 
                              month(consumption$Date_Time) == 2 &
                              mday(consumption$Date_Time) <= 2 )

png(file = "plot4.png")
par(mfrow = c(2, 2))

with(consumption2,{
       plot(Date_Time,Global_active_power,type = "l",
                        ylab = "Global Active Power",
                        xlab = "")

       plot(Date_Time,Voltage,type = "l",
                        ylab = "Voltage",
                        xlab = "datetime")

       plot(Date_Time, Sub_metering_1,type = "l",
                        ylab = "Energy sub metering",
                        xlab = "")
       lines(consumption2$Date_Time,consumption2$Sub_metering_2, col = "red")
       lines(consumption2$Date_Time,consumption2$Sub_metering_3, col = "blue")
       legend("topright", bty="n", lwd=1, col = c("black","red","blue" ), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

       plot(Date_Time,Global_reactive_power,type = "l",
                        ylab = "Global_reactive_power",
                        xlab = "datetime")

})

dev.off()