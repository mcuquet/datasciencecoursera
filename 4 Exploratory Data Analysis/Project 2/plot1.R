library(dplyr)

## Files and directories.
dataDir <- "./exdata_data_NEI_data"
outputPath <- "./plots"
outputFileName <- "plot1.png"

## Read and prepare data.
NEI <- readRDS(paste(dataDir, "summarySCC_PM25.rds", sep = "/"))
SCC <- readRDS(paste(dataDir, "Source_Classification_Code.rds", sep = "/"))
total_yearly_emissions <- NEI %>%
  group_by(year) %>%
  summarise(TotalEmissions = sum(Emissions))

## Plot.
png(filename = paste(outputPath, outputFileName, sep = "/"),
    width = 480, height = 480, units = "px")
with(total_yearly_emissions,
     plot(year, TotalEmissions, type = "b",
          xlab = "Year", ylab = "Emissions",
          main = "Total yearly emissions of PM2.5",
          xaxp = c(min(year), max(year), length(year)-1)))
dev.off()

## Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008?
## Answer:
# Yes, the total emissions have decreased in the United States.