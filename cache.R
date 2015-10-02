hospRecords <<- read.csv("D:\\R-Dev\\Programing Assingment 3\\outcome-of-care-measures.csv", colClasses = "character")

hospRecords[, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] <- as.numeric(hospRecords[, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"])
hospRecords[, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"] <- as.numeric(hospRecords[, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"])
hospRecords[, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"] <- as.numeric(hospRecords[, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"])