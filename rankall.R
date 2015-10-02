rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  rankedHosp <- data.frame("hospital" = character(0),"state" = character(0), stringsAsFactors = FALSE)
  currentRow <- 1
  for(x in sort(unique(hospRecords$State)))
  {
    rankedHosp[currentRow, ] <- c(rankhospital(x, outcome, num),x)
    currentRow = currentRow + 1
  }
  
  return (rankedHosp)
}