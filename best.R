best <- function(stateName, outcome) {
  if(nrow( subset(hospRecords[c("State")], State == stateName)) < 1)
  {
    stop (paste0('Error in best("' , stateName,'", "',outcome,'") : invalid state'))
  }
  
  if(outcome != "heart failure" && outcome != "heart attack" && outcome != "pneumonia")
  {
    stop(paste0('Error in best("' , stateName,'", "',outcome,'") : invalid outcome'))
  }
  
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

  validRecords <- subset(hospRecords[c(bestTest, "State", "Hospital.Name")], State == stateName )
  validRecords <- subset(validRecords,complete.cases(validRecords))
  record <- which.min(validRecords[,1])
  
  return ( validRecords[record, "Hospital.Name"]  )
}
