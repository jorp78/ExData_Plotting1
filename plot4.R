setwd("~/EDA/")
# Previos this file, is necesary execute "downAndClean.R"
housePwrCmsptnClean <- readRDS(file="./data/household_power_consumption_resume.Rds");

# divide windows, 2 lines and 2 columns
par(mfrow = c(2,2))

# add first image: Date_Time and Global_active_power
plot(housePwrCmsptnClean$Date_Time, housePwrCmsptnClean$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# add second image:Date_Time and Voltage
plot(housePwrCmsptnClean$Date_Time, housePwrCmsptnClean$Voltage, type = "l", xlab = "Date Time", ylab = "Global Active Power")

# add third image: Date_Time and Sub_metering 1 to 3.
plot(housePwrCmsptnClean$Date_Time, housePwrCmsptnClean$Sub_metering_1,
       main ="" , xlab = "",ylab = "Energy Sub Metering ",type = "l");

  ## Add lines
    lines(housePwrCmsptnClean$Date_Time,housePwrCmsptnClean$Sub_metering_3, col= "blue")
    lines(housePwrCmsptnClean$Date_Time,housePwrCmsptnClean$Sub_metering_2, col= "red")

  ## Add legends
  listLegends <- c("Sub Metering 1","Sub Metering 2","Sub Metering 3");
  colorLegends <- c("black", "red", "blue");
  legend(x="topright", legend=listLegends, col=colorLegends, lwd=c(1,1), lty=c(1,1));

# add fourth image : Date_Time and Global_reactive_power
plot(housePwrCmsptnClean$Date_Time, housePwrCmsptnClean$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")

    