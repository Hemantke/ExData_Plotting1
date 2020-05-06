
#Reading the data precisely between  2007-02-01 to 2007-02-02
#The exact values of skip and nrows were found by operating on data

data=read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66637,nrows=2880)
d<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
names(data)=names(d)


#Alternate way is to read data, then subset.
#This is slower and can be done by the following code:

#data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#data=subset(data,Date=="1/2/2007" | Date=="2/2/2007")


#For storing Date and timetogether in the column Date
data$Date<-with(data,paste(Date,Time))
data$Date <- strptime(data$Date,"%d/%m/%Y %T")

png("plot4.png")

par(mfrow=c(2,2),mar=c(3,4.5,2,2))

with(data,plot(Date,Global_active_power,"l",ylab="Global Active Power"))

with(data,plot(Date,Voltage,"l",ylab="Voltage(V)"))

with(data,plot(Date,Sub_metering_1,"l",ylab="Energy sub metering"))
with(data,points(Date,Sub_metering_2,"l",col="red"))
with(data,points(Date,Sub_metering_3,"l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

with(data,plot(Date,Global_reactive_power,"l",ylab="Global Rective Power"))

dev.off()