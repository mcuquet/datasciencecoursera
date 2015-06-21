library(dplyr)

## Files and directories.
dataDir <- "./exdata_data_NEI_data"
outputPath <- "./plots"
outputFileName <- "plot5.png"

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
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(TotalEmissions = sum(Emissions))

## Plot.
png(filename = paste(outputPath, outputFileName, sep = "/"),
    width = 600, height = 480, units = "px")
with(vehicle,
     plot(year, TotalEmissions, type = "b",
          xlab = "Year", ylab = "Emissions",
          main = "Total yearly emissions of motor vehicle sources in Baltimore City, Maryland",
          xaxp = c(min(year), max(year), length(year)-1)))
dev.off()

## Question 5:
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City? 
## Answer:
# They have decreased, especiall in the first period (1999-2002).