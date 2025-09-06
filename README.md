# r-programming-assignments

# Heidy Lopez

LIS4317

Repository for R Programming Assignments

# Module 2: Testing `myMean` Function

**Code in R:**

**Test Vector**

```r
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
```

**Original Function**

```r
myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}

myMean(assignment2)
```

**Error Message**

```r
Error in myMean(assignment2) : object 'assignment' not found
```

**Corrected Function:**

```r
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

myMean(assignment2)
```

```r
[1] 19.25
```

***Error Explained***
The original myMean function caused an error because it referred to variables named assignment and someData, which were not defined. The function's input parameter assignment2 was not used inside the function. After updating the code to consistently use assignment2, the function correctly calculates and returns the mean of the input vector.






**Blog Post**
https://heidy204462e4947b-geaoc.wordpress.com/2025/09/05/module-2-testing-mymean-function/
