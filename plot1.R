plot1 <- function() {
     hist(gap_df, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
     
     ## Output to another device
     dev.copy(png, file="plot1.png", width=480, height=480)
     dev.off()
     cat("Plot1.png has been saved in", getwd())
}
plot1()