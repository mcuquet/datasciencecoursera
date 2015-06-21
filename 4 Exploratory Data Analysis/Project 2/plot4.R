library(dplyr)

## Files and directories.
dataDir <- "./exdata_data_NEI_data"
outputPath <- "./plots"
outputFileName <- "plot4.png"

## Read and prepare data.
NEI <- readRDS(paste(dataDir, "summarySCC_PM25.rds", sep = "/"))
SCC <- readRDS(paste(dataDir, "Source_Classification_Code.rds", sep = "/"))

# Coal combustion related sources can be found by looking at elements in
# EI.Sector that contain "Coal" or "coal" and "Comb" or "comb".
coalcombIndex <- SCC %>%
  slice(grep('([Cc]omb.*[Cc]oal|[Cc]oal.*[Cc]omb)', SCC$EI.Sector)) %>%
  select(SCC, EI.Sector)
# Get relevant data from NEI.
coalcomb <- merge(NEI, coalcombIndex, by.x = "SCC", by.y = "SCC", all = FALSE)
# And summarise it grouping by year.
coalcomb <- coalcomb %>%
  group_by(year) %>%
  summarise(TotalEmissions = sum(Emissions))

## Plot.
png(filename = paste(outputPath, outputFileName, sep = "/"),
    width = 480, height = 480, units = "px")
with(coalcomb,
     plot(year, TotalEmissions, type = "b",
          xlab = "Year", ylab = "Emissions",
          main = "Total yearly emissions of coal combustion-related PM2.5",
          xaxp = c(min(year), max(year), length(year)-1)))
dev.off()

## Question 4:
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?
## Answer:
# They have decreased, especially in the last period (2005-2008).