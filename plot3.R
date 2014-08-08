#source the common function for reading and subsetting the dataset (ie. readData())
source("readData.R")

#-------------------------------
#FUNCTION makePlot3
#plots a line chart of the three sub metering variables
#saves the plot as a PNG in plot3.png
#------------------------------
makePlot3 <- function()
{
     #get the tidy filtered dataset
     data <- readData()
     
     #make sure to order by date
     data <- with(data, data[order(DateTime),])
     
     #open the PNG file 480x480
     png("plot3.png", 
          width     = 480,
          height    = 480,
          units     = "px")
                  
     #line graph with sub meter 1, 
     #no x axis label and no main title
     plot(data$DateTime,
          data$Sub_metering_1, 
          type="l", 
          ylab="Energy sub metering", 
          xlab="")
     
     #add sub meter #2 (red) and sub meter #3 (blue)
     lines(data$DateTime, data$Sub_metering_2, col="red")
     lines(data$DateTime, data$Sub_metering_3, col="blue")
     
     #add legend with colored lines 
     legend("topright", 
            col=c("black", "red", "blue"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty=c(1,1,1),
            lwd=c(2.5,2.5,2.5))     
     
     #close the PNG file
     dev.off()
     
     message("File created -- plot3.png")
     
     #return the dataset - invisible
     invisible(data)
}