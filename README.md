# r-programming-assignments

# Heidy Lopez

LIS4317

Repository for R Programming Assignments

# Assignment 2: Testing `myMean` Function

# Test Result

Code inR:

# Test Vector
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

***Original Function**

myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}

myMean(assignment2)

**Error Message**
Error in myMean(assignment2) : object 'assignment' not found

**Corrected Function:**
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

myMean(assignment2)
#Output: 19.25
