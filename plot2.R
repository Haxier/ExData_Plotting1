plot2 <- function(){
    # read the data
    my_data <- read.table("./household_power_consumption.txt", 
                          sep = ";", na.strings = "?", header = TRUE)
    #subset data
    plot_data <- subset(my_data, Date== "1/2/2007" | Date == "2/2/2007")
    plot_data$dateTime = paste(plot_data$Date, plot_data$Time)
    # Convert to Date/Time class
    plot_data$dateTime <- strptime(plot_data$dateTime, "%d/%m/%Y %H:%M:%S")
    # set graphics device
    png("plot2.png", width=480, height=480, units="px")
    # Plot of Global active power minute by minute
    with(plot_data, plot(dateTime, as.numeric(as.character(Global_active_power)), type="l", 
                         xlab="", ylab="Global Active Power (kilowatts)"))
    dev.off()
}