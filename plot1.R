#source the common function for reading and subsetting the dataset (ie. readData())
source("readData.R")

#-------------------------------
#FUNCTION makePlot1
#plots a histgram of the Global Active Power of the energy dataset
#saves the plot as a PNG in plot1.png
#------------------------------
makePlot1 <- function()
{
     #get the tidy filtered dataset
     data <- readData()
     
     #open the PNG file 480x480
     png("plot1.png", 
         width     = 480,
         height    = 480,
         units     = "px")
     
     #create histogram
     hist(data$Global_active_power, 
          col="red", 
          xlab="Global Active Power (kilowatts)",
          main="Global Active Power")
     
     #close the PNG file
     dev.off()
     
     
     message("File created -- plot1.png")
     
     #return the dataset (invisible)
     invisible(data)
}