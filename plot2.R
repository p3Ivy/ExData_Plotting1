plot2 <- function() {
     plot(power_df$timestamp, gap_df, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     
     ## Output to another device
     dev.copy(png, file="plot2.png", width=480, height=480)
     dev.off()
     cat("Plot2.png has been saved in", getwd())
}
plot2()

