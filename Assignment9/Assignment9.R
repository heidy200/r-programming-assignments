install.packages("AER")
library(AER)
data("BondYield", package = "AER")
BondYield <- data.frame(
  time = time(BondYield),
  value = as.numeric(BondYield)
)

# Base R Scatter Plot
plot(as.numeric(bond_df$time), as.numeric(bond_df$value),
     type = "p",
     pch = 19,
     col = "blue",
     xlab = "Year",
     ylab = "Yield (%)",
     main = "Base R: Time vs. Bond Yield")


# Histogram
hist(BondYield$value,
     main = "Base: Distribution of Bond Yields",
     xlab = "Yield (%)",
     col  = "lightgreen",
     border = "white")


# Lattice Graphics
library(lattice)
BondYield$period <- cut(BondYield$time,
                        breaks = seq(1983, 1993, 2),
                        labels = c("1983–1984", "1985–1986", "1987–1988",
                                   "1989–1990", "1991–1992"))

# Conditional scatter plot
xyplot(value ~ time | factor(period),
       data = BondYield,
       main = "Lattice: Bond Yield vs. Time by Period",
       xlab = "Year",
       ylab = "Yield (%)",
       pch  = 16,
       col  = "darkorange")

# Boxplot
bwplot(value ~ factor(period),
       data = BondYield,
       main = "Lattice: Bond Yield by Period",
       xlab = "Year Range",
       ylab = "Yield (%)",
       fill = "lightblue")


# ggplot graphics

library(ggplot2)

ggplot(BondYield, aes(x = time, y = value, color = factor(period))) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "ggplot2: Bond Yield Trend Over Time",
       x = "Year", y = "Yield (%)")

ggplot(BondYield, aes(x = value, fill = period)) +
  geom_histogram(binwidth = 0.2, color = "white") +
  facet_wrap(~ period) +
  labs(title = "ggplot2: Yield Distribution by Period",
       x = "Yield (%)", y = "Count")

