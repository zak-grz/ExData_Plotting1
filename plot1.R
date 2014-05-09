plot1<-function(file)
{
  mydata<-read.table(file,sep=";",skip=66637,nrows=2880)
  colnames(mydata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  png("plot1.png")
  
  hist(mydata[,"Global_active_power"],xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
  dev.off()
}