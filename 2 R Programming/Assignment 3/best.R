# 'state': 2-character code for a state
# 'outcome' accepted values: "heart attack", "heart failure", "pneumonia"

best <- function(state, outcome) {
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
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  dataState <- data[data$State == state, c(2, col)]
  dataState[, 2] <- suppressWarnings(as.numeric(dataState[, 2]))
  dataState <- dataState[order(dataState[,2], xtfrm(dataState[,1]), na.last = NA), ]
  dataState[1, 1]
}