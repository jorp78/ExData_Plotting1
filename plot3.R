setwd("~/EDA/")
# Previos this file, is necesary execute "downAndClean.R"
housePwrCmsptnClean <- readRDS(file="./data/household_power_consumption_resume.Rds");

# Create image
plot(housePwrCmsptnClean$Date_Time, housePwrCmsptnClean$Sub_metering_1,
           main ="" , xlab = "",ylab = "Energy Sub Metering ",type = "l");

# Add lines
lines(housePwrCmsptnClean$Date_Time,housePwrCmsptnClean$Sub_metering_3, col= "blue")
lines(housePwrCmsptnClean$Date_Time,housePwrCmsptnClean$Sub_metering_2, col= "red")

# Add legends
listLegends <- c("Sub Metering 1","Sub Metering 2","Sub Metering 3");
colorLegends <- c("black", "red", "blue");

legend(x="topright", legend=listLegends, col=colorLegends, lwd=c(1,1), lty=c(1,1));

# copy and save
dev.copy(png, file="plot3.png", width=480, height=480)

#close device
dev.off()
