##Exploratory Data Analysis, Week 1 - Course Project 1
##Plot 4: 4 Plots of Different Measured Variables Over Time

# Downloading data from online location
web.zip<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tmp<-tempfile(tmpdir="C:/Users/Pep Llontop/Documents/ExData_Plotting1") #creating
#a temporary file for the downloaded file to go to
download.file(web.zip,tmp) #downloading the zipped data folder
data.file<-unzip(tmp) #unzipping the data set folder
data<-fread(data.file,na.strings="?") #reading the data into R and creating a 
#data table

# Subsetting data for use in plotting
data1<-subset(data,data$Date=="1/2/2007")
data2<-subset(data,data$Date=="2/2/2007")


##Combine the Date and Time Columns of both data subsets

#Merge data1 Time and Date
Date1<-vector(nrow(data1),mode="character") #create an empty character vector
for(i in 1:length(Date1)){
        Date1[i]<-"2007-02-01" #replace original date values with a recognizable format
}
date.time1<-paste(Date1,data1[,Time],sep=" ")#Creates a vector containing Date and Time
#in "%Y-%m-%d %H:%M:%s" format

#Merge data2 Time and Date (same method as for date.time1)
Date2<-vector(nrow(data2),mode="character")
for(i in 1:length(Date2)){
        Date2[i]<-"2007-02-02"
}
date.time2<-paste(Date2,data2[,Time],sep=" ")#Creates a vector containing Date and Time
#in "%Y-%m-%d %H:%M:%s" format

all.date.time<-c(date.time1,date.time2) #create one vector with all dates and times
x<-as.POSIXct(all.date.time) #convert date/time values to POSIXct format for plotting


##Global Active Power Data
gap1<-as.numeric(data1[,Global_active_power])
gap2<-as.numeric(data2[,Global_active_power])

all.gap<-c(gap1,gap2)

##Energy Sub Metering Data
#Sub_metering_1 for data1 and data2
SM1_data1<-as.numeric(data1[,Sub_metering_1])
SM1_data2<-as.numeric(data2[,Sub_metering_1])
sub_met_1<-c(SM1_data1,SM1_data2)

#Sub_metering_2 for data1 and data2
SM2_data1<-as.numeric(data1[,Sub_metering_2])
SM2_data2<-as.numeric(data2[,Sub_metering_2])
sub_met_2<-c(SM2_data1,SM2_data2)

#Sub_metering_3 for data1 and data2
SM3_data1<-as.numeric(data1[,Sub_metering_3])
SM3_data2<-as.numeric(data2[,Sub_metering_3])
sub_met_3<-c(SM3_data1,SM3_data2)

##Voltage Data
Volt_1<-as.numeric(data1[,Voltage])
Volt_2<-as.numeric(data2[,Voltage])
all_Volt<-c(Volt_1,Volt_2)

##Global Reactive Power Data
grp_1<-as.numeric(data1[,Global_reactive_power])
grp_2<-as.numeric(data2[,Global_reactive_power])
all_grp<-c(grp_1,grp_2)

##Launch png graphics device and plot all four plots
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))

#Plot Global Active Power
plot(x,all.gap,type="l",xlab=" ",ylab="Global Active Power")

#Plot Sub Metering
plot(x,sub_met_1,type="n",xlab=" ",ylab="Energy sub metering")
#Add the data to the plot
lines(x,sub_met_1,col="black")
lines(x,sub_met_2,col="red")
lines(x,sub_met_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n")

#Plot Voltage
plot(x,all_Volt,type="l",xlab="datetime",ylab="Voltage")

#Plot Global Reactive Power
plot(x,all_grp,type="l",xlab="datetime",ylab="Global_reactive_power")
axis(2,at=c(0.1,0.3,0.5),labels=c(0.1,0.3,0.5))

dev.off()