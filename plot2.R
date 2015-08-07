##----------------------------------------------------------------
## plot 2
## plot Global Active Power along 1/2/2007 to 2/2/2007
## 2015-08-07

#------------------------------------------------------------------
## load selective data into R
datafile<-file('household_power_consumption.txt')
data<-read.table(text=grep('^[1,2]/2/2007', readLines(datafile), 
                           value=T), header=T, sep=';', col.names=c(
                             'date', 'time', 'global_active_power', 
                             'global_reactive_power', 'voltage', 
                             'global_intensity', 'sub_metering_1', 
                             'sub_metering_2', 'sub_metering_3'))
head(data)

## transfer date and time into datetime
data$datetime<-as.POSIXlt(paste(data$date, " ", data$time), format=
                            '%d/%m/%Y %H:%M:%S')
head(data$datetime)

## Plot
png('plot2.png', h=480, w=480)
plot(data$datetime, data$global_active_power, type='l', ylab='Global Active Power(kilowatts)')
dev.off()