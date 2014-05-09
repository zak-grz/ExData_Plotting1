plot2<-function(file)
{
  mydata<-read.table(file,sep=";",skip=66637,nrows=2880)
  colnames(mydata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  
  DateTime<-paste(mydata[,1],mydata[,2],sep=" ")
  numericDate<-as.numeric(strptime(DateTime, "%d/%m/%Y %H:%M:%S"))
  
  
  png("plot2.png")
  
  plot(numericDate,mydata[,3],xaxt="n",type="l",xlab="",ylab="Global Active Power (kilowatts)")
  axis(1, at=c(min(numericDate), min(numericDate)+86400,  min(numericDate)+2*86400),labels=c("Thu", "Fri", "Sat"))   
  dev.off()
}