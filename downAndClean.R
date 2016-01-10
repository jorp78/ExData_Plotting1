setwd("~/EDA/")
  ## This function download the data file and cleaning if this not exist.
  ## Load Libraries
  library(dplyr);

  # Check if "data" directory exists
  if(!dir.exists("~/EDA/data")){
    dir.create("./data");
  }


  ## URL of Dataset: Electric power consumption 
  fileUrl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

  ## Check the file exist or download
  if(!file.exists("./data/household_power_consumption.zip")){
    download.file(fileUrl1,destfile="./data/household_power_consumption.zip",method="curl");
    unzip("./data/household_power_consumption.zip", list = FALSE, overwrite = FALSE, exdir = "./data")
  }
  
  ## Load the data
  housePwrCmsptn <- read.csv2("./data/household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE)
  
  # Transsform to dplyr dataFrame
  housePwrCmsptnDply <-  tbl_df(housePwrCmsptn)
  
  ## Cleaning
  housePwrCmsptnClean <- 
    transform(housePwrCmsptnDply, Date   = as.Date(Date,"%d/%m/%Y") ) %>%
      filter( Date  >= as.Date("2007-02-01 ") & Date <= as.Date("2007-02-02")) %>%
        transform( Global_active_power = as.numeric(Global_active_power)) %>%
          transform( Global_reactive_power = as.numeric(Global_reactive_power)) %>%
            transform( Global_intensity = as.numeric(Global_intensity)) %>%    
              transform(Voltage  = as.numeric(Voltage)) %>%
                transform(Sub_metering_1  = as.numeric(Sub_metering_1)) %>%
                  transform(Sub_metering_2  = as.numeric(Sub_metering_2)) %>%
                    transform(Sub_metering_3  = as.numeric(Sub_metering_3)) %>%
                      mutate(Date_Time = as.POSIXct(paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
  
  ## Write the values in a new file
  saveRDS(housePwrCmsptnClean, file="./data/household_power_consumption_resume.Rds");
  
  # Clean Memory
  rm(fileUrl1,housePwrCmsptn,housePwrCmsptnDply, housePwrCmsptnClean)

