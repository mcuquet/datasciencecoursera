corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  cr <- numeric(0)
  
  for (file in list.files(directory, full = TRUE)) {
    data <- read.csv(file)
    good <- complete.cases(data)
    if (sum(good, na.rm = TRUE) > threshold) {
      cr <- c(cr, cor(data[,"sulfate"], data[,"nitrate"],
                      use = "na.or.complete"))
    }
  }
  
  cr
}