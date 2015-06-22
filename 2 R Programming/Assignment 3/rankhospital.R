rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  valid_states <- unique(data$State)
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (! is.element(state, valid_states)) {
    stop("invalid state")
  }
  col = if (outcome == "heart attack") 11
  else if (outcome == "heart failure") 17
  else if (outcome == "pneumonia") 23
  else stop("invalid outcome")
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  dataState <- data[data$State == state, c(2, col)]
  dataState[, 2] <- suppressWarnings(as.numeric(dataState[, 2]))
  dataState <- dataState[order(dataState[,2], xtfrm(dataState[,1]), na.last = NA), ]
  
  last <- length(dataState[[1]]);
  if (num == "best") {
    dataState[[1, 1]]
  } else if (num == "worst") {
    dataState[[last, 1]]
  } else if (num >= 1 && num <= last) {
    dataState[[num, 1]]
  } else {
    NA
  }
}