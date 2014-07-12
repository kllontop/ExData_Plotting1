##Exploratory Data Analysis, Week 1 - Course Project 1
##Plot 3: Multi-colored Line Plot of 3 Sub-Metering Variables over Time

# Downloading data from online location
web.zip<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

tmp<-tempfile(tmpdir="C:/Users/Llontop/Documents/ExData_Plotting1") #creating
#a temporary file for the downloaded file to go to

download.file(web.zip,tmp) #downloading the zipped data folder

data.file<-unzip(tmp) #unzipping the data set folder

data<-fread(data.file,na.strings="?") #reading the data into R and creating a 
#data table

# Subsetting data for use in plotting
data1<-subset(data,data$Date=="1/2/2007")
data2<-subset(data,data$Date=="2/2/2007")

#create one vector with all dates and times
dates_and_times<-paste(as.Date(c(data1[,Date],data2[,Date]),format="%d/%m/%Y"),c(data1[,Time],data2[,Time]),sep=" ")

#convert date/time values to POSIXct format for plotting
Time<-as.POSIXct(dates_and_times)

##Create three separate sub_metering variables, converting "character" class data to 
##"vector" class for plotting
#Sub_metering_1 for data1 and data2
sub_met_1<-as.numeric(c(data1[,Sub_metering_1],data2[,Sub_metering_1]))

#Sub_metering_2 for data1 and data2
sub_met_2<-as.numeric(c(data1[,Sub_metering_2],data2[,Sub_metering_2]))

#Sub_metering_3 for data1 and data2
sub_met_3<-as.numeric(c(data1[,Sub_metering_3],data2[,Sub_metering_3]))


#initiate a blank graph with y label "Energy sub metering"
png("plot3.png",width=480,height=480)
plot(Time,sub_met_1,type="n",xlab=" ",ylab="Energy sub metering")
#Add the data to the plot
lines(Time,sub_met_1,col="black")
lines(Time,sub_met_2,col="red")
lines(Time,sub_met_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()
