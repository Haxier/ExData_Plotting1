# R script that creates the first plot in the Exploratory Analysis course
# week1 assigment

plot1 <- function(){
    #set initial variables
    first <- as.Date("2007/02/01", format = "%Y/%m/%d")
    last <- as.Date("2007/02/02", format = "%Y/%m/%d")
    # read the data
    my_data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
    # convert date column into R Date class
    dates <- as.Date(my_data$Date, format= "%d/%m/%Y")
    my_data <- mutate(my_data, Date = dates)
    #subset data
    plot_data <- subset(my_data, Date <= last & Date >= first)
    
    #open png graphics device
    png(filename = "plot1.png", width = 480, height = 480)
    
    #create histogram
    #with(my_data, hist(Global_active_power, col="red", main = "Global Active Power"))
    with(plot_data, hist(Global_active_power, col="red", main = "Global Active Power", 
                       xlab= "Global Active Power (kilowatts)"))
    # close ghaphics device
    dev.off()
    
} 