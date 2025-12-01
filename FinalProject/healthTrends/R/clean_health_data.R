#' Clean health mortality data (customized for CDC dataset)
#'
#' @param df Raw CDC mortality dataset.
#'
#' @return A cleaned tibble with standardized columns:
#' date, year, month, heart, respiratory, covid
#'
#' @export
clean_health_data <- function(df) {

  # Required columns
  required_cols <- c(
    "Year",
    "Month",
    "Diseases of Heart",
    "Chronic Lower Respiratory Diseases",
    "COVID-19 (Underlying Cause of Death)"
  )

  # Check for missing columns
  missing_cols <- required_cols[!required_cols %in% names(df)]
  if (length(missing_cols) > 0) {
    stop("Missing required columns: ", paste(missing_cols, collapse = ", "))
  }

  # Create cleaned dataset
  cleaned <- df |>
    dplyr::mutate(
      year = as.integer(.data$Year),
      month = as.integer(.data$Month),
      heart = as.numeric(.data$`Diseases of Heart`),
      respiratory = as.numeric(.data$`Chronic Lower Respiratory Diseases`),
      covid = as.numeric(.data$`COVID-19 (Underlying Cause of Death)`),
      date = lubridate::make_date(year, month, 1)
    ) |>
    dplyr::select(date, year, month, heart, respiratory, covid) |>
    dplyr::arrange(date)

  return(cleaned)
}
