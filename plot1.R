##----------------------------------------------------------------
## plot 1
## histogram of Global Active Power
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

## make histogram for Global Active Power
png('plot1.png', h=480, w=480)
hist(data$global_active_power, col='red', main='Global Active Power', 
            xlab='Global Active Power(kilowatts)')
dev.off()