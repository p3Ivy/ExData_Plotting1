plot4 <- function() {
     par(mfrow=c(2,2))
     
     ## Topleft plot
     plot(power_df$timestamp, gap_df, type="l", xlab="", ylab="Global Active Power")

     ## Topright plot
     plot(power_df$timestamp, volt_df, type="l", xlab="datetime", ylab="Voltage")
     
     ## Bottomleft plot
     plot(power_df$timestamp,sub_m1, type="l", xlab="", ylab="Energy sub metering")
     lines(power_df$timestamp,sub_m2,col="red")
     lines(power_df$timestamp,sub_m3,col="blue")
     legend("topright", col=c("black","red","blue"), 
            c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
            lty = c(1,1), bty = "n", cex = .5, lwd = c(1,1))
          ## bty removes the box
          ## cex shrinks the text
          ## lwd ensures spacing added after labels so it renders correctly
     
     ## Bottomright plot
     plot(power_df$timestamp,grp_df, type="l", xlab="datetime", ylab="Global_reactive_power")
     
     ## Output to another device
     dev.copy(png, file="plot4.png", width=480, height=480)
     dev.off()
     cat("plot4.png has been saved in", getwd())
}
plot4()
