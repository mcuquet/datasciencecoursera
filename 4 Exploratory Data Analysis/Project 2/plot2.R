library(dplyr)

## Files and directories.
dataDir <- "./exdata_data_NEI_data"
outputPath <- "./plots"
outputFileName <- "plot2.png"

## Read and prepare data.
NEI <- readRDS(paste(dataDir, "summarySCC_PM25.rds", sep = "/"))
SCC <- readRDS(paste(dataDir, "Source_Classification_Code.rds", sep = "/"))
total_yearly_emissions_BaltimoreCity <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(TotalEmissions = sum(Emissions))

## Plot.
png(filename = paste(outputPath, outputFileName, sep = "/"),
    width = 480, height = 480, units = "px")
with(total_yearly_emissions_BaltimoreCity,
     plot(year, TotalEmissions, type = "b",
          xlab = "Year", ylab = "Emissions",
          main = "Total yearly emissions of PM2.5 in Baltimore City, Maryland",
          xaxp = c(min(year), max(year), length(year)-1)))
dev.off()

## Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008?
## Answer:
# Yes, the total emissions have overall decreased in Baltimore City, Maryland,
# although 2005 registered a higher value than 2002.