##Exploratory Data Analysis, Week 1 - Course Project 1
##Plot 4: 4 Plots of Different Measured Variables Over Time

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

#Further subsetting the Global Active Power data and coercing the data to the 
#numeric class for plotting
global_active_power<-as.numeric(c(data1[,Global_active_power],data2[,Global_active_power]))

##Create three separate sub_metering variables, converting "character" class data to 
##"vector" class for plotting
#Sub_metering_1 for data1 and data2
sub_met_1<-as.numeric(c(data1[,Sub_metering_1],data2[,Sub_metering_1]))

#Sub_metering_2 for data1 and data2
sub_met_2<-as.numeric(c(data1[,Sub_metering_2],data2[,Sub_metering_2]))

#Sub_metering_3 for data1 and data2
sub_met_3<-as.numeric(c(data1[,Sub_metering_3],data2[,Sub_metering_3]))

##Voltage Data
Volt<-as.numeric(c(data1[,Voltage],data2[,Voltage]))

##Global Reactive Power Data
global_reactive_power<-as.numeric(c(data1[,Global_reactive_power],data2[,Global_reactive_power]))

##Launch png graphics device and plot all four plots
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))

#Plot Global Active Power
plot(Time,global_active_power,type="l",xlab=" ",ylab="Global Active Power")

#Plot Sub Metering
plot(Time,sub_met_1,type="n",xlab=" ",ylab="Energy sub metering")
#Add the data to the plot
lines(Time,sub_met_1,col="black")
lines(Time,sub_met_2,col="red")
lines(Time,sub_met_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n")

#Plot Voltage
plot(Time,Volt,type="l",xlab="datetime",ylab="Voltage")

#Plot Global Reactive Power
plot(Time,global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
axis(2,at=c(0.1,0.3,0.5),labels=c(0.1,0.3,0.5))

dev.off()