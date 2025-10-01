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

# Create diagonal
diag_part <- diag(3, 5)

# Create first column
col1 <- c(3, rep(2, 4))

# Create second row onward
custom_matrix <- diag_part
custom_matrix[1, 2:5] <- 1
custom_matrix[2:5, 1] <- 2

# Replace first column
custom_matrix[,1] <- col1
custom_matrix
