#----------------------------------
#FUNCTION: readData
#reads the household_power_consumption.txt from the current working directory
#returns a data set subsetted to only Feb 1, 2007 and Feb 2, 2007 observations
#and a converted date column

readData <- function(){
     
     #read the file into a dataset
     #semicolon seperated
     #? in the file are converted to NA's
     tempData <- read.table("household_power_consumption.txt",
                            header=T,
                            sep=";",
                            colClasses=c(rep("character",2),rep("numeric",7)),
                            na.strings="?")
     
     #make a new variable $DateTime that combines the $Date and $Time columns into a date variable
     #assume the current timezone
     tempData$DateTime <- strptime( paste(tempData$Date,tempData$Time), 
                                    format="%d/%m/%Y %H:%M:%S")
     
     #we don't need the $Date and $Time variables anymore
     tempData$Date <- NULL
     tempData$Time <- NULL
     
     #return only the observations for 2/1/2007 and 2/2/2007 (all minutes)
     subset(tempData, (DateTime >= "2007-02-01 00:00:00"  & DateTime <= " 2007-02-02 23:59:59"))
}