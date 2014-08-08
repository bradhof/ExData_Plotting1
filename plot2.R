#source the common function for reading and subsetting the dataset (ie. readData())
source("readData.R")

#-------------------------------
#FUNCTION makePlot2
#plots a line chart of  the Global Active Power of the energy dataset
#saves the plot as a PNG in plot2.png
#------------------------------
makePlot2 <- function()
{
     #get the tidy filtered dataset
     data <- readData()
     
     #make sure to order by date
     data <- with(data, data[order(DateTime),])
     
     #open the PNG file 480x480
     png("plot2.png",
         width     = 480,
         height    = 480,
         units     = "px")
     
     #line graph with no x axis label and no main title
     plot(x = data$DateTime, 
          y = data$Global_active_power, 
          type="l", 
          ylab="Global Active Power (kilowatts)", 
          xlab="")
     
     #close the PNG file
     dev.off()
     
     message("File created -- plot2.png")
     
     #return the dataset - invisible
     invisible(data)
}