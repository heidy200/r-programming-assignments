# Define matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Addition
A_plus_B <- A + B
A_plus_B

# Subtraction
A_minus_B <- A - B
A_minus_B

# Create a Diagonal Matrix
D <- diag(c(4, 1, 2, 3))
D

# Create a 5×5 diagonal matrix
diag_part <- diag(3, 5)

# Create the first column
col1 <- c(3, rep(2, 4))

# Create the first row 
row1 <- c(3, rep(1, 4))

# Modify the diagonal matrix 
custom_matrix <- diag_part
custom_matrix[,1] <- col1
custom_matrix[1,] <- row1

# Display the result
custom_matrix
