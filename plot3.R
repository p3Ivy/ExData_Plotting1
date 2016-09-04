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