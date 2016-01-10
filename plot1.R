setwd("~/EDA/")
# Previos this file, is necesary execute "downAndClean.R"
housePwrCmsptnClean <- readRDS(file="./data/household_power_consumption_resume.Rds");

# Create Graphic.
hist(housePwrCmsptnClean$Global_active_power,main ="Global Active Power" ,
     col=2,xlab = "Global Active Power (kilowaits)" )

# Copy and save the generate image
dev.copy(png, file="./plot1.png", width=480, height=480)

# Close device
dev.off()
