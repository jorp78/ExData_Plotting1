setwd("~/EDA/")
# Previos this file, is necesary execute "downAndClean.R"
housePwrCmsptnClean <- readRDS(file="./data/household_power_consumption_resume.Rds");

# Create image
plot(housePwrCmsptnClean$Date_Time, housePwrCmsptnClean$Global_active_power, main ="",
     xlab = "",ylab = "Global Active Power (Kilowaits)",type = "l");

# copy and save
dev.copy(png, file="plot2.png", width=480, height=480);

# close device
dev.off();
