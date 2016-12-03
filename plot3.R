plot3 <- function(){
        # Because the assignment only uses data from the dates 2007-02-01 and 2007-02-02. 
        # To save computer resourse, it should only read the data from just those dates 
        # rather than reading in the entire dataset and subsetting to those dates.
        
        # In order to do that, the package "sqldf" is used
        library(sqldf)
        
        # Load the needed data
        data <- read.csv.sql("household_power_consumption.txt", header = TRUE, 
                             sep = ";",sql = 'select * from file where Date = "1/2/2007" 
                             or Date = "2/2/2007"')  
        
        # create a png file contain the plot3
        png('plot3.png')
        
        # Plot figure 3
        plot(1:nrow(data), data$Sub_metering_1, type ="l", xlab = '', xaxt='n', 
             ylab = paste("Energy sub metering"))
        lines(1:nrow(data), data$Sub_metering_2, type ="l", col = "red",xlab = '', xaxt='n')
        lines(1:nrow(data), data$Sub_metering_3, type ="l", col = "blue",xlab = '', xaxt='n')
        
        # find positions for marker (Thu, Fri, Sat) where time is "00:00:00", 
        # note that this time for Sat is not available, so it is needed to added
        p = which(data$Time == "00:00:00") # position of marker "Thu" and "Fri"
        int = p[2] - p[1]  # interval between marker "Thu" and "Fri"
        m = c(p[1], p[2], p[2]+int) # position of marker "Thu", "Fri" and "Sat"
        axis(1, at = m, labels=c("Thu", "Fri", "Sat")) # add marker to plot
        legend("topright", lty=1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        dev.off() # close png device
}