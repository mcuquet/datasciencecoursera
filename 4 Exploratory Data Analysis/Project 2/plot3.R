library(dplyr)
library(ggplot2)

## Files and directories.
dataDir <- "./exdata_data_NEI_data"
outputPath <- "./plots"
outputFileName <- "plot3.png"

## Read and prepare data.
NEI <- readRDS(paste(dataDir, "summarySCC_PM25.rds", sep = "/"))
SCC <- readRDS(paste(dataDir, "Source_Classification_Code.rds", sep = "/"))
yearly_emissions_BaltimoreCity_by_type <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(TotalEmissions = sum(Emissions))

## Plot.
png(filename = paste(outputPath, outputFileName, sep = "/"),
    width = 600, height = 480, units = "px")
g <- qplot(year, TotalEmissions, data = yearly_emissions_BaltimoreCity_by_type,
      color = type, shape = type, geom = c("point", "line"),
      xlab = "Year", ylab = "Emissions",
      main = "Total yearly emissions of PM2.5 by type in Baltimore City, Maryland")
g <- g + scale_x_continuous(breaks = seq(1999, 2008, 3))
print(g)
dev.off()

## Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008?
## Answer:
# Nonpoint, nonroad and onroad have decreased in the period 1999-2008. Point has
# increased, although in the last period (2005-2008) it shows a strong decrease.