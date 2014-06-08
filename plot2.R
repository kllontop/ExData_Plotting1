##Exploratory Data Analysis, Week 1 - Course Project 1
##Plot 2: XY Line Plot of Global Active Power over Time

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

#Further subsetting the Global Active Power data and coercing the data to the 
#numeric class for plotting
gap1<-data1[,Global_active_power]
gap1.num<-as.numeric(gap1)

gap2<-data2[,Global_active_power]
gap2.num<-as.numeric(gap2)

all.gap<-c(gap1.num,gap2.num) #combine all Global Active Power data


##Combine the Date and Time Columns of both data subsets for ease in plotting
#Merge data1 Time and Date
Date1<-vector(nrow(data1),mode="character")
for(i in 1:length(Date1)){
        Date1[i]<-"2007-02-01"
}
date.time1<-paste(Date1,data1[,Time],sep=" ")#Creates a vector containing Date and Time
#in "%Y-%m-%d %H:%M:%s" format

#Merge data1 Time and Date
Date2<-vector(nrow(data2),mode="character")
for(i in 1:length(Date2)){
        Date2[i]<-"2007-02-02"
}
date.time2<-paste(Date2,data2[,Time],sep=" ")#Creates a vector containing Date and Time
#in "%Y-%m-%d %H:%M:%s" format

all.date.time<-c(date.time1,date.time2) #create one vector with all dates and times
x<-as.POSIXct(all.date.time) #convert date/time values to POSIXct format for plotting

#create the png plot for plot2
png("plot2.png",width=480,height=480)
plot(x,all.gap,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()



