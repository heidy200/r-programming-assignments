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
print.student_s3 <- function(obj) {
  print(paste("Student Name:", obj$name))
  print(paste("Age:", obj$age))
  print(paste("GPA:", obj$GPA))
}

print(s3_obj)
summary(s3_obj) # To show differences between S3 and S4

# Define an S4 class
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))

# Create an S4 object
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

# Define a generic print function if not already defined
setGeneric("print", function(x, ...) standardGeneric("print"))

# Define a method for the student_s4 class
setMethod("print", "student_s4", function(x) {
  print(paste("Student Name:", x@name))
  print(paste("Age:", x@age))
  print(paste("GPA:", x@GPA))
})

print(s4_obj)
summary(s4_obj) # To show differences between S3 and S4

