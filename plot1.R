
## Plot 1

library(dplyr)
library(lubridate)

## Create a data frame tbl
consumption<-tbl_df(read.delim2("data/household_power_consumption.txt", header = TRUE,sep = ";",dec = ".", na.strings = "?"))

consumption$Date_Time<- paste(consumption$Date, consumption$Time) ## Concatenate Strings Date and Time
consumption$Date_Time<-dmy_hms(consumption$Date_Time) ## Paq lubridate. Parse dates that have hours, minutes, or seconds elements


## Paq. dplyr & lubridate.  Filter for 2007-02-01 and 2007-02-02
consumption2 <- filter(consumption,year(consumption$Date_Time) == 2007 & 
                                   month(consumption$Date_Time) == 2 &
                                   mday(consumption$Date_Time) <= 2 )



png(file = "plot1.png")

hist(consumption2$Global_active_power, col ="red", 
                                          main = "Global Active Power",
                                          xlab = "Global Active Power (kilowatts)")
dev.off()

