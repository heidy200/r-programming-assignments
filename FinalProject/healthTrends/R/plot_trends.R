#' Plot mortality trends for a single cause
#'
#' @param df A cleaned dataset created by clean_health_data().
#' @param cause Which cause to plot: "heart", "respiratory", or "covid".
#'
#' @return A ggplot2 line plot.
#'
#' @export
plot_trends <- function(df, cause = c("heart", "respiratory", "covid")) {

  cause <- match.arg(cause)

  # Validate df
  if (!is.data.frame(df)) {
    stop("df must be a data frame created by clean_health_data().")
  }

  if (!"date" %in% names(df)) {
    stop("df must contain a 'date' column. Did you run clean_health_data()?")
  }

  if (!cause %in% names(df)) {
    stop(paste("Column", cause, "is missing from df."))
  }

  ggplot2::ggplot(df, ggplot2::aes(x = date, y = .data[[cause]])) +
    ggplot2::geom_line(color = "steelblue", size = 1.1) +
    ggplot2::labs(
      title = paste("Monthly deaths from", cause),
      x = "Date",
      y = "Number of deaths"
    ) +
    ggplot2::theme_minimal()
}


#' Plot mortality trends for all three causes
#'
#' Creates a combined line plot with heart, respiratory,
#' and covid deaths over time.
#'
#' @param df A cleaned dataset created by clean_health_data().
#'
#' @return A ggplot2 line plot.
#'
#' @export
plot_trends_all <- function(df) {

  if (!is.data.frame(df)) {
    stop("df must be a data frame created by clean_health_data().")
  }

  required <- c("date", "heart", "respiratory", "covid")
  missing <- setdiff(required, names(df))

  if (length(missing) > 0) {
    stop("Missing required columns: ", paste(missing, collapse = ", "))
  }

  df_long <- df |>
    tidyr::pivot_longer(
      cols = c("heart", "respiratory", "covid"),
      names_to = "cause",
      values_to = "count"
    )

  ggplot2::ggplot(df_long, ggplot2::aes(x = date, y = count, color = cause)) +
    ggplot2::geom_line(size = 1.1) +
    ggplot2::labs(
      title = "Monthly deaths from heart disease, respiratory disease, and COVID-19",
      x = "Date",
      y = "Number of deaths",
      color = "Cause"
    ) +
    ggplot2::scale_color_manual(
      values = c(
        heart = "firebrick",
        respiratory = "darkgreen",
        covid = "steelblue"
      )
    ) +
    ggplot2::theme_minimal()
}

