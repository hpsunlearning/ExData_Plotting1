### I read in the first 100 lines in order to get colnames
### I have read the whole data and figured out which lines belongs to 2007-02-01 and 2007-02-02, 
### so I then only read these lines using arg skip and nrows
### I found stringsAsFactors is very annoying so I set it F that no factor variable showed up
a <- read.table("household_power_consumption.txt",sep = ';', header = T, nrows = 100)
cname <- colnames(a)
a <- read.table("household_power_consumption.txt",sep = ';', header = T, stringsAsFactors = F, 
    na.strings = '?', skip = 66636, nrows = 2880)
colnames(a) <- cname


###plot3
### fix the time issue by combine Date and Time together and creat a new variable
a$sTime <- strptime(paste(a$Date, a$Time), "%d/%m/%Y %H:%M:%S")
### first prepare a emtpy plot with xrange and yrange enough for 3 sub_meterings
xrange <- range(a$sTime)
yrange <- range(c(a$Sub_metering_1,a$Sub_metering_2,a$Sub_metering_3))
png(file="plot3.png",bg = "transparent")
plot(xrange,yrange,type="n",xlab="",ylab="Energy sub metering")
lines(a$sTime,a$Sub_metering_1,col="black")
lines(a$sTime,a$Sub_metering_2,col="red")
lines(a$sTime,a$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()