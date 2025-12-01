# healthTrends 📊  
Exploring Heart Disease, Respiratory Illness, and COVID-19 Mortality Trends

## Overview
`healthTrends` is an R package I created to explore monthly CDC mortality data for heart disease, chronic lower respiratory diseases, and COVID-19. The package includes functions that clean the data, summarize yearly trends, and create visualizations that make it easier to see how these causes of death have changed over time. I developed this package as part of a course project on health data analysis and R package development.

## Key Features
✔ Cleans and prepares CDC mortality data  
✔ Summarizes deaths by year and cause  
✔ Custom S3 print and summary methods  
✔ Single-cause trend plots  
✔ Combined trend plots for all three causes  

## Installation
To load the package from your project directory while developing, use:

```r
devtools::load_all()
library(healthTrends)
```

Make sure the necessary packages are installed:

```r
install.packages(c("dplyr", "lubridate", "ggplot2", "tidyr", "readr"))
```

## Dataset
This package uses the CDC’s “Monthly Provisional Counts of Deaths by Select Causes” dataset. Download the CSV from the CDC Data Portal and save it in:

```
healthTrends/data-raw/
```

Load the data in R:

```r
raw_df <- readr::read_csv("data-raw/cdc_monthly_deaths.csv")
cleaned <- clean_health_data(raw_df)
```

The `clean_health_data()` function standardizes the dataset and creates the columns: `date`, `year`, `month`, `heart`, `respiratory`, and `covid`.

## Functions

### `clean_health_data(df)`
Cleans and standardizes CDC mortality data.

### `summarize_causes(df)`
Summarizes yearly totals for each major cause and returns an object of class `health_summary`.

### `plot_trends(df, cause)`
Creates a line plot for a selected cause (`"heart"`, `"respiratory"`, or `"covid"`).

### `plot_trends_all(df)`
Creates a combined line plot showing all three causes on one graph.

## Example Workflow

```r
# Load data
raw_df <- readr::read_csv("data-raw/cdc_monthly_deaths.csv")

# Clean data
cleaned <- clean_health_data(raw_df)

# Summaries
summary_obj <- summarize_causes(cleaned)
summary_obj           
summary(summary_obj)  

# Visualizations
plot_trends(cleaned, "heart")
plot_trends(cleaned, "respiratory")
plot_trends(cleaned, "covid")

# Combined plot
plot_trends_all(cleaned)
```

## S3 Methods
This package includes custom S3 methods for:
- `print.health_summary`
- `summary.health_summary`

These methods format the summary output in a cleaner, more readable way.

## License
MIT License  
© 2025 Heidy Lopez




