# Import data
student6 <- read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)

# Compute mean grade by sex
library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Write the grouped means to a text file:
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

# Select rows where Name contains “i” or “I”:
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Extract just the names and write them to a CSV:
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

# Save the full filtered data frame to a CSV:
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)

# Confirm files exist
file.exists("gender_mean.txt")
file.exists("i_students.csv")
file.exists("i_students_full.csv")

