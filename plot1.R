plot1 <- function(){

        # Because the assignment only uses data from the dates 2007-02-01 and 2007-02-02. 
        # To save computer resourse, it should only read the data from just those dates 
        # rather than reading in the entire dataset and subsetting to those dates.
        
        # In order to do that, the package "sqldf" is used
        
        library(sqldf)
        
        # Load the needed data
        data <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";",
                             sql = 'select * from file where Date = "1/2/2007" or 
                             Date = "2/2/2007"')  
        
        # create a png file contain the plot1
        png('plot1.png')
        
        # Plot figure 1
        hist(data$Global_active_power, col = "red", main = paste("Global Active Power"),
             xlab = paste("Global Active Power (kilowatts)"))
        
        dev.off()
}
