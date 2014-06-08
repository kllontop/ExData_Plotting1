##Exploratory Data Analysis, Week 1 - Course Project 1
##Plot 1: Histogram of Global Active Power

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

#Further subsetting the Global Active Power data and coercing the data to the 
#numeric class for plotting
gap1<-data1[,Global_active_power]
gap1.num<-as.numeric(gap1)

gap2<-data2[,Global_active_power]
gap2.num<-as.numeric(gap2)

all.gap<-c(gap1.num,gap2.num)

#Initialize png graphics device and create png file
png("plot1.png",width=480,height=480)
hist(all.gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()