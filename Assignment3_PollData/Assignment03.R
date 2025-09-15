# Assignment03.R

# Define vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

# Combine into Data Frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect Data
str(df_polls)
head(df_polls)

# ABC Poll
mean(df_polls$ABC_poll)
mean(df_polls$CBS_poll)
range(df_polls$ABC_poll)

# CBS Poll
median(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

# Add a column for the difference between CBS and ABC:
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_pol

df_polls

# Plot differences
library(ggplot2)
ggplot(df_polls, aes(x = Name, y = Diff, fill = Name)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Difference Between CBS and ABC Polls",
    x = "Candidate",
    y = "Poll Difference"
  ) +
  theme_minimal()
