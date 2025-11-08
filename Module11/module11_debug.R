tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)


# Defensive, corrected, and self-contained Tukey multiple outlier function
corrected_tukey <- function(x) {
  # Defensive checks
  if (!is.matrix(x)) {
    stop("Error: Input must be a matrix.")
  }
  if (!is.numeric(x)) {
    stop("Error: Matrix must contain only numeric values.")
  }
  if (nrow(x) == 0 || ncol(x) == 0) {
    stop("Error: Matrix cannot be empty.")
  }
  
  # Initialize logical array
  outliers <- array(TRUE, dim = dim(x))
  
  # Apply Tukey rule for each column
  for (j in seq_len(ncol(x))) {
    qnt <- quantile(x[, j], probs = c(0.25, 0.75))
    H <- 1.5 * IQR(x[, j])
    col_outliers <- (x[, j] < (qnt[1] - H)) | (x[, j] > (qnt[2] + H))
    outliers[, j] <- outliers[, j] & col_outliers
  }
  
  # Check for rows that are outliers in all columns
  outlier.vec <- apply(outliers, 1, all)
  
  return(outlier.vec)
}

# Test the function
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
corrected_tukey(test_mat)

