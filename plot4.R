plot4<-function(file)
{
  mydata<-read.table(file,sep=";",skip=66637,nrows=2880)
  colnames(mydata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
 
  DateTime<-paste(mydata[,1],mydata[,2],sep=" ")
  numericDate<-as.numeric(strptime(DateTime, "%d/%m/%Y %H:%M:%S"))
  
  
  png("plot4.png",width=800,height=800)
  par(mfrow=c(2,2))
  
  plot(numericDate,mydata[,3],type="l",ylab="Global Active Power",xaxt="n",xlab="")
  axis(1, at=c(min(numericDate), min(numericDate)+86400,  min(numericDate)+2*86400),labels=c("Thu", "Fri", "Sat"))   
  
  plot(numericDate,mydata[,5],type="l",xlab="datetime",ylab="Voltage",xaxt="n")
  axis(1, at=c(min(numericDate), min(numericDate)+86400,  min(numericDate)+2*86400),labels=c("Thu", "Fri", "Sat"))   
  
  plot(numericDate,mydata[,7],type="l",ylim=c(0,38),xaxt="n",ylab="",xlab="")
  axis(1, at=c(min(numericDate), min(numericDate)+86400,  min(numericDate)+2*86400),labels=c("Thu", "Fri", "Sat"))   
  par(new=TRUE)
  plot(numericDate,mydata[,8],type="l",ylim=c(0,38),xaxt="n",ylab="",xlab="",col="red")
  par(new=TRUE)
  plot(numericDate,mydata[,9],type="l",ylim=c(0,38),xaxt="n",ylab="Energy sub metering",xlab="",col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
         lty=1, col=c('black', 'red', 'blue'), bty='n',cex=1,pt.cex=1)#y.intersp=0.4)
  
  plot(numericDate,mydata[,4],type="l",xlab="datetime",ylab="Global_reactive_power",xaxt="n")
  axis(1, at=c(min(numericDate), min(numericDate)+86400,  min(numericDate)+2*86400),labels=c("Thu", "Fri", "Sat"))   
  dev.off()
}
