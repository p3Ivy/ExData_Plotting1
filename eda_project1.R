## Exploratory Data Analysis
## Project #1 - Plotting Power Consumption

## Goal - examine how household energy usage varies over a 2-day period in February, 2007 by reproducing a series of four plots. 

## Objective - Reproduce a series of 4 plots and utilize Git/GitHub.

## Data - Electric Power Consumption Dataset from UC Irvine Machine Learning Repository
## Data Description - This dataset contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are also available.

## Step #1 - Prep Data

## Go to UCI database to obtain dataset, download file and extract it to your working directory: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

## Read text file into environment
ptable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Let's explore our dataset
head(ptable)

## Yikes! Let's get that date under control
ptable$Date <- as.Date(ptable$Date, format="%d/%m/%Y")    ## Ah...much nicer.

names(ptable)
## [1] "Date"                   "Time"                  "Global_active_power"  
## [4] "Global_reactive_power"  "Voltage"               "Global_intensity"     
## [7] "Sub_metering_1"         "Sub_metering_2"        "Sub_metering_3"       

dim(ptable)      ##[1] 2075259    9

## Holy moly! Since this dataset is large, let's create a dataframe for the two dates we are interested in
p_df <- ptable[(ptable$Date=="2007-02-01") | (ptable$Date=="2007-02-02"), ]

## Transform the date so it is much more convenient by adding a new timestamp column
p_df <- transform(p_df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## Okay, let's checkout what we have
head(p_df)
dim(p_df)       ##[1] 2880      9!!

## So let's get going. Create dataframes for each variable we will be working with
## Global Active Power dataframe
gap_df <- as.numeric(as.character(power_df$Global_active_power))

## Global Reactive Power dataframe
grp_df <- as.numeric(as.character(power_df$Global_reactive_power))

## Voltage dataframe 
volt_df <- as.numeric(as.character(p_df$Voltage))

## Create Submetering dataframes
sub_m1 <- as.numeric(as.character(p_df$Sub_metering_1))
sub_m2 <- as.numeric(as.character(p_df$Sub_metering_2))
sub_m3 <- as.numeric(as.character(p_df$Sub_metering_3))

#
#

## Step #2 - Setup Repo
## Fork repo from GitHub
## When finished, it would be located here - https://github.com/NAMEOFYOURREPOWILLBEHERE/ExData_Plotting1

## Clone repo from Git 
## git clone https://github.com/rdpeng/ExData_Plotting1

#
#

## Step #3 - It's Plotting Time!
## Name each of the plot files as plot1.png, plot2.png, etc.
## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot 
## Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.

## Plot #1 - (plot1.R)
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
plot1 <- function() {
    hist(gap_df, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

    ## Output to another device
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
    cat("Plot1.png has been saved in", getwd())
}
plot1()

## After building plots, test sourcing files
## source ("R/plot1.R")

## Plot #2 - (plot2.R)
plot2 <- function() {
    plot(p_df$timestamp,gap_df, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        
    ## Output to another device
    dev.copy(png, file="plot2.png", width=480, height=480)
    dev.off()
    cat("plot2.png has been saved in", getwd())
}
plot2()

## Plot #3 - (plot3.R)
plot3 <- function() {
     plot(power_df$timestamp,sub_m1, type="l", xlab="", ylab="Energy sub metering")
     lines(power_df$timestamp,sub_m2,col="red")
     lines(power_df$timestamp,sub_m3,col="blue")
     legend("topright", col=c("black","red","blue"), 
            c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
     
     ## Output to another device
     dev.copy(png, file="plot3.png", width=480, height=480)
     dev.off()
     cat("Plot3.png has been saved in", getwd())
}
plot3()

## Plot #4 - (plot4.R)
plot4 <- function() {
     par(mfrow=c(2,2))
     
     ## Topleft plot
     plot(p_df$timestamp, gap_df, type="l", xlab="", ylab="Global Active Power")

     ## Topright plot
     plot(p_df$timestamp, volt_df, type="l", xlab="datetime", ylab="Voltage")
     
     ## Bottomleft plot
     plot(p_df$timestamp,sub_m1, type="l", xlab="", ylab="Energy sub metering")
     lines(p_df$timestamp,sub_m2,col="red")
     lines(p_df$timestamp,sub_m3,col="blue")
     legend("topright", col=c("black","red","blue"), 
            c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
            lty = c(1,1), bty = "n", cex = .5, lwd = c(1,1))
          ## bty removes the box
          ## cex shrinks the text
          ## lwd ensures spacing added after labels so it renders correctly
     
     ## Bottomright plot
     plot(p_df$timestamp,grp_df, type="l", xlab="datetime", ylab="Global_reactive_power")
     
     ## Output to another device
     dev.copy(png, file="plot4.png", width=480, height=480)
     dev.off()
     cat("plot4.png has been saved in", getwd())
}
plot4()

## Step #4 - Get ready to repoooooooooooooo!!!!!!
## Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
## When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.