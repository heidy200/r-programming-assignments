# Test vector
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Original function 
myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}

# Run the function
myMean(assignment2)
# Error in myMean(assignment2) : object 'assignment' not found

# Corrected function
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

# Run the function
myMean(assignment2)  # Output: 19.25
