plot3 <- function(){
    # read the data
    my_data <- read.table("./household_power_consumption.txt", 
                          sep = ";", na.strings = "?", header = TRUE)
    #subset data
    plot_data <- subset(my_data, Date== "1/2/2007" | Date == "2/2/2007")
    plot_data$dateTime = paste(plot_data$Date, plot_data$Time)
    # Convert to Date/Time class
    plot_data$dateTime <- strptime(plot_data$dateTime, "%d/%m/%Y %H:%M:%S")
    # set graphics device
    png("plot3.png", width=480, height=480, units="px")
    # Plot Energy sub metering
    with(plot_data, plot(dateTime, as.numeric(as.character(Sub_metering_1)), 
              type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40)))
    lines(plot_data$dateTime, as.numeric(as.character(plot_data$Sub_metering_2)), col="red")
    lines(plot_data$dateTime, as.numeric(as.character(plot_data$Sub_metering_3)), col="blue")
    # add legend
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
    dev.off()
}