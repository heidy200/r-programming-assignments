#' Summarize yearly mortality by cause
#'
#' @param df A cleaned dataset created by clean_health_data().
#'
#' @return An object of class "health_summary" containing:
#'   - data: a tibble with yearly totals
#'   - n_years: number of years
#'   - causes: list of included causes
#'
#' @export
summarize_causes <- function(df) {

  # Check input type
  if (!is.data.frame(df)) {
    stop("Input must be a data frame created by clean_health_data().")
  }

  required_cols <- c("year", "heart", "respiratory", "covid")
  missing <- setdiff(required_cols, names(df))

  if (length(missing) > 0) {
    stop("Missing required columns: ", paste(missing, collapse = ", "),
         "\nDid you run clean_health_data() first?")
  }

  # Replace missing values with zero
  df <- df |>
    dplyr::mutate(
      heart = ifelse(is.na(heart), 0, heart),
      respiratory = ifelse(is.na(respiratory), 0, respiratory),
      covid = ifelse(is.na(covid), 0, covid)
    )

  # Create yearly totals
  yearly <- df |>
    dplyr::group_by(year) |>
    dplyr::summarise(
      heart = sum(heart),
      respiratory = sum(respiratory),
      covid = sum(covid),
      .groups = "drop"
    )

  # Build summary object
  result <- list(
    data = yearly,
    n_years = nrow(yearly),
    causes = c("heart", "respiratory", "covid")
  )

  class(result) <- "health_summary"
  return(result)
}
