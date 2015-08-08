#-------------------------------------
## plot 4
## combination of a few plot of the energy use along 01/02/2007 and 02/02/2007
## 20150808
#-------------------------------------

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

## plot
png('plot4.png', h=480, w=480)
par(mfrow=c(2,2))
plot(data$datetime, data$global_active_power, ylab='Global Active Power', type='l', xlab='')
plot(data$datetime, data$voltage, xlab='datetime', ylab='Voltage', type='l')
plot(data$datetime, data$sub_metering_1, ylab='Energy sub metering', type='l', xlab='')
lines(data$datetime, data$sub_metering_2, col='red')
lines(data$datetime, data$sub_metering_3, col='blue') 
legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 
                                                             'Sub_metering_2',
                                                             'Sub_metering_3'), 
            lty=1, bty='n')
plot(data$datetime, data$global_reactive_power, xlab='datetime', ylab='Global_reactive_power',
          type='l')
dev.off()