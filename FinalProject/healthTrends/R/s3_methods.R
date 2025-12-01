#' Print method for health_summary objects
#'
#' @param x An object of class "health_summary".
#' @param ... Additional arguments (ignored).
#'
#' @export
print.health_summary <- function(x, ...) {
  if (!inherits(x, "health_summary")) {
    stop("Object is not of class 'health_summary'.")
  }

  cat("Health Summary\n")
  cat("Years:", min(x$data$year), "to", max(x$data$year), "\n")
  cat("Number of years:", x$n_years, "\n")
  cat("Causes:", paste(x$causes, collapse = ", "), "\n\n")

  print(x$data, row.names = FALSE)
  invisible(x)
}


#' Summary method for health_summary objects
#'
#' @param object An object of class "health_summary".
#' @param ... Additional arguments (ignored).
#'
#' @export
summary.health_summary <- function(object, ...) {
  if (!inherits(object, "health_summary")) {
    stop("Object is not of class 'health_summary'.")
  }

  dat <- object$data

  stats <- list(
    heart = c(
      min = min(dat$heart, na.rm = TRUE),
      max = max(dat$heart, na.rm = TRUE),
      mean = mean(dat$heart, na.rm = TRUE)
    ),
    respiratory = c(
      min = min(dat$respiratory, na.rm = TRUE),
      max = max(dat$respiratory, na.rm = TRUE),
      mean = mean(dat$respiratory, na.rm = TRUE)
    ),
    covid = c(
      min = min(dat$covid, na.rm = TRUE),
      max = max(dat$covid, na.rm = TRUE),
      mean = mean(dat$covid, na.rm = TRUE)
    )
  )

  result <- list(
    year_range = range(dat$year),
    stats = stats
  )

  class(result) <- "summary.health_summary"

  cat("Summary of Health Summary Object\n")
  cat("Year range:", result$year_range[1], "to", result$year_range[2], "\n\n")

  for (cause in names(stats)) {
    cat("Cause:", cause, "\n")
    cat("  Min: ", round(stats[[cause]]["min"]), "\n")
    cat("  Max: ", round(stats[[cause]]["max"]), "\n")
    cat("  Mean:", round(stats[[cause]]["mean"]), "\n\n")
  }

  invisible(result)
}

