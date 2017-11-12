### I read in the first 100 lines in order to get colnames
### I have read the whole data and figured out which lines belongs to 2007-02-01 and 2007-02-02, 
### so I then only read these lines using arg skip and nrows
### I found stringsAsFactors is very annoying so I set it F that no factor variable showed up
a <- read.table("household_power_consumption.txt",sep = ';', header = T, nrows = 100)
cname <- colnames(a)
a <- read.table("household_power_consumption.txt",sep = ';', header = T, stringsAsFactors = F, 
    na.strings = '?', skip = 66636, nrows = 2880)
colnames(a) <- cname
### fix the time issue by combine Date and Time together and creat a new variable
a$sTime <- strptime(paste(a$Date, a$Time), "%d/%m/%Y %H:%M:%S")
###plot1
png(file="plot1.png",bg="transparent")
with(a,hist(Global_active_power,col="red",
    xlab="Global Active Power (kilowatts)",ylab = "Frequency",main="Global Active Power"))
dev.off()