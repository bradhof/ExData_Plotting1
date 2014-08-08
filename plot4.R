#source the common function for reading and subsetting the dataset (ie. readData())
source("readData.R")

#-------------------------------
#FUNCTION makePlot3
#plots a line chart of the three sub metering variables
#saves the plot as a PNG in plot3.png
#------------------------------
makePlot4 <- function()
{
     #get the tidy filtered dataset
     data <- readData()
     
     #make sure to order by date
     data <- with(data, data[order(DateTime),])
     
     #open the PNG file 480x480
     png("plot4.png", 
          width     = 480,
          height    = 480,
          units     = "px")
                  
     #make a 2x2 chart grid
     par(mfrow=c(2,2))
          
     #chart1 - line chart for global active power
     plot(x = data$DateTime, 
          y = data$Global_active_power, 
          type="l", 
          ylab="Global Active Power", 
          xlab="")
     
     
     #chart2 - line chart for global active power
     plot(x = data$DateTime, 
          y = data$Voltage, 
          type="l", 
          ylab="Voltage", 
          xlab="datetime")
     
     #chart 3 - submetering (3 lines) with legend
     #plot first line
     plot(data$DateTime,
          data$Sub_metering_1, 
          type="l", 
          ylab="Energy sub metering", 
          xlab="")
     
     #add sub meter #2 (red) and sub meter #3 (blue)
     lines(data$DateTime, data$Sub_metering_2, col="red")
     lines(data$DateTime, data$Sub_metering_3, col="blue")
     
     #add legend with colored lines - no border
     legend("topright", 
            col=c("black", "red", "blue"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = c(1,1,1),
            lwd = c(2.5,2.5,2.5),
            bty = "n",
            cex = 0.95)     

     #chart4 - line chart for global reactive power
     plot(x = data$DateTime, 
          y = data$Global_reactive_power, 
          type="l", 
          ylab="Global_reactive_power", 
          xlab="datetime")
     
     
     #close the PNG file
     dev.off()
     
     message("File created -- plot4.png")
     
     #return the dataset - invisible
     invisible(data)
}