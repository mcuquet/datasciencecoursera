library(dplyr)
library(ggplot2)

## Files and directories.
dataDir <- "./exdata_data_NEI_data"
outputPath <- "./plots"
outputFileName <- "plot6.png"

## Read and prepare data.
NEI <- readRDS(paste(dataDir, "summarySCC_PM25.rds", sep = "/"))
SCC <- readRDS(paste(dataDir, "Source_Classification_Code.rds", sep = "/"))

# Select the sectors with an explicit "vehicle" description (hence exlcuding
#aircrafts, marine vessels, etc.)
vehicleIndex <- SCC %>%
  slice(grep('[Vv]ehicle', SCC$EI.Sector)) %>%
  select(SCC, EI.Sector)
# Get relevant data from NEI.
vehicle <- merge(NEI, vehicleIndex, by.x = "SCC", by.y = "SCC", all = FALSE)
# And summarise it grouping by year and filtering for Baltimore City.
vehicle <- vehicle %>%
  filter(fips == "24510" | fips == "06037") %>%
  group_by(year, fips) %>%
  summarise(TotalEmissions = sum(Emissions))
vehicle <- merge(vehicle,
                 data.frame(fips = c("24510", "06037"),
                            County = c("Baltimore City", "Los Angeles County")))
# Calculate the normalized emissions, so it's easier to compare the evolution.
vehicle <- vehicle %>%
  group_by(County) %>%
  mutate(TotalEmissionsN = TotalEmissions / max(TotalEmissions))

## Plot.
png(filename = paste(outputPath, outputFileName, sep = "/"),
    width = 600, height = 480, units = "px")
g <- qplot(year, TotalEmissionsN, data = vehicle,
           color = County, shape = County, geom = c("point", "line"),
           xlab = "Year", ylab = "Emissions",
           main = "Relative yearly emissions of motor vehicle sources")
g <- g + scale_x_continuous(breaks = seq(1999, 2008, 3))
print(g)
dev.off()

## Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California
# (fips == "06037"). Which city has seen greater changes over time in motor
# vehicle emissions?
## Answer:
# Regarding motor vehicle emissions, the relative change has been greater for
# Baltimore City.