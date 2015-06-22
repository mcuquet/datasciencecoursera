rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that outcome is valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  col = if (outcome == "heart attack") 11
  else if (outcome == "heart failure") 17
  else if (outcome == "pneumonia") 23
  else stop("invalid outcome")
  
  ## For each state, find the hospital of the given rank
  # cols: 2 - name; 7 - state; col - outcome
  data <- data[, c(2, 7, col)]
  data[, 3] <- suppressWarnings(as.numeric(data[, 3]))
  colnames(data) <- c("hospital", "state", "outcome")
  data <- data[with(data, order(outcome, xtfrm(hospital), na.last = NA)), ]
  
  data <- do.call(rbind, lapply(split(data, data$state), function(chunk) chunk[
    if (num == "best") 1
    else if (num == "worst") nrow(chunk)
    else num
    , ]))
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  data[, "state"] <- row.names(data)
  data[c("hospital", "state")]
}