# Exploratory Data Analysis - Week 01 Course Project 1

# creating a data frame with the dataset from Electric power consumption   ------
my_df <- read.table(file = './data/household_power_consumption.txt', header = TRUE, sep = ";",
                    na.strings = "?", stringsAsFactors=FALSE)


# modifying from character to Date the my_df$Date with "as.Date"  ------
my_df$Date <- as.Date(my_df$Date, format = '%d/%m/%Y')      


# subsetting the data frame my_df to manageable size and constraining the time period from  
# 2007-2-1 to 2007-2-2 
df <- subset(my_df, Date >= '2007/2/1' & Date <='2007/2/2')   


# re indexing the data frame df ---------------
rownames(df) <- 1:nrow(df)


# combining Date and Time then creating dt dataframe for DateTime then adding dt$DateTime to df data frame ----
dt <- as.data.frame(with(df, as.POSIXct(paste(Date, Time))))  
names(dt)[names(dt) == "with(df, as.POSIXct(paste(Date, Time)))"] <- 'DateTime'
df['DateTime'] <- dt$DateTime   
                         

# creation of the histograms and the plot1.png. N screen display ----

#1.0
# Open png graphics device
png(filename = "plot1.png",
    width = 480, height = 480,
    units = "px",
    bg = "white")

# histogram creation
hist(df$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (Killowatts)",
     col = "red", 
     ylim = c(0,1200))     

# close png graphics device
dev.off()


