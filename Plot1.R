library(dplyr)

#Read the Data
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)

subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

head(subdata)

#Formatting the data
GAP<-select(subdata,Global_active_power)
GAP1<-mutate(GAP,Global_active_power=as.numeric(as.character(Global_active_power)))

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Create Plot
hist(GAP1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Save to PNG
png(filename = "plot1.png")  

hist(GAP1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()

