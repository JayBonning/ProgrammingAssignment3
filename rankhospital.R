rankhospital <- function(stateName, outcome, num = "best") {
  
  #Perform basic checks to start
  if(nrow( subset(hospRecords[c("State")], State == stateName)) < 1)
  {
    stop (paste0('Error in best("' , stateName,'", "',outcome,'") : invalid state'))
  }
  
  if(outcome != "heart failure" && outcome != "heart attack" && outcome != "pneumonia")
  {
    stop(paste0('Error in best("' , stateName,'", "',outcome,'") : invalid outcome'))
  }
  
  
  #Set the outcome desired to rank
  if(outcome == "heart failure")
  {
    bestTest <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }
  else if(outcome == "heart attack")
  {
    bestTest <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  }
  else if(outcome == "pneumonia")
  {
    bestTest <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  
  #Get the valid records for the state
  validRecords <- subset(hospRecords[c(bestTest, "State", "Hospital.Name")], State == stateName )
  validRecords <- subset(validRecords,complete.cases(validRecords))
  
  #sort the records
  sortedRecords <- validRecords[order(validRecords[,1], validRecords[,3]), 1:3 ]
  
  #account for "special" input
  if(num == "best")
  {
    num <- 1
  }
  else if(num == "worst")
  {
    num <- nrow(sortedRecords)
  }
  
  #return the value
  return ( sortedRecords[num, "Hospital.Name"]   )
}