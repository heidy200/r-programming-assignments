# Display the first few rows and check structure
data("mtcars")
head(mtcars)
str(mtcars)

# Apply generic function
print(summary(mtcars))   
plot(mtcars$mpg, mtcars$hp,
     main = "MPG vs Horsepower",
     xlab = "Miles Per Gallon",
     ylab = "Horsepower")

# Create a simple S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Define a custom print method for the S3 class
print.student_s3 <- function(x) {
  cat("S3 Student Object:\n")
  cat("Name:", x$name, "\nAge:", x$age, "\nGPA:", x$GPA, "\n")
}
print(s3_obj)

# Define an S4 class
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))

# Create an S4 object
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

# Define a generic print function if not already defined
setGeneric("print", function(x, ...) standardGeneric("print"))

# Define a method for the student_s4 class
setMethod("print", "student_s4", function(x) {
  cat("Student Name:", x@name, "\n")
  cat("Age:", x@age, "\n")
  cat("GPA:", x@GPA, "\n")
})

s4_obj
