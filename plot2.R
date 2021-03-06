
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

#For the plot
png("plot2.png")
with(data,plot(Date,Global_active_power,"l",ylab="Global Active Power (kilowatts)"))
dev.off()