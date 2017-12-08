library("data.table")

powerT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


powerT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


powerT <- powerT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = powerT[, dateTime]
     , y = powerT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
