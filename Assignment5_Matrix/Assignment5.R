# Define Matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Inspect Dimensions
dim(A)  # should be 10 × 10
dim(B)  # 10 × 100 — not square

# Compute Inverse and Determinant
# For A
invA <- solve(A)
detA <- det(A)

# Inspect Results
invA   
detA 

# For B, use tryCatch to capture errors
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

# Investigate Results        
invB
detB

