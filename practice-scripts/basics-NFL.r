# Simple statistical commands
2+2
365/7
log(10)

# Create an object
# "<-" represents an "assign value" command. Please note "=" sign is conventionally reserved to assign value within functions
greeting <- "Hello World!"
greeting


# Case Study: Which of the last three head coaches for Philadelphia Eagles had the highest win percentage?

# Recent Coaching history
# Chip Kelly (2013-2015)
# Doug Pederson (2016-2020)
# Nick Sirianni (2021-Present)

# Create a vector containing the number of wins 2012-2024
W <- c(10, 10, 7, 7, 13, 9, 9, 4, 9, 14, 11, 14)
mean(W)

# Create a vector containing the number of losses 2012-2024
L <- c(6, 6, 9, 9, 3, 7, 7, 11, 8, 3, 6, 3)

# Create a vector for ties
T <- c(0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)

# Create a new variable: win percentage
Win.Pct <- 100 * W/(W+L+T)
mean(Win.Pct)

# View win.pct
Win.Pct

# Create a year vector
Year <- seq(2013, 2024)
Year[Win.Pct>60]

# Aggregate all of our variables into a matrix
Eagles_matrix <- matrix(c(Year, W, L, T), 12, 4)
Eagles_matrix

# Aggregate all of our variables into a table
Eagles_df <- data.frame(Wins = W, Losses = L, Ties = T, Win.Pct = Win.Pct, Year = Year)
Eagles_df

plot(Eagles_df$Year, Eagles_df$Win.Pct)

plot(Eagles_df$Year, Eagles_df$Win.Pct, xlab = "NFL Season", ylab = "Season Win Percentage", main = "Win Percentage by Year")

# Create a vector for coaches
Coach <- c("Kelly",
           "Kelly",
           "Kelly/Shurmur",
           "Pederson",
           "Pederson",
           "Pederson",
           "Pederson",
           "Pederson",
           "Sirianni",
           "Sirianni",
           "Sirianni",
           "Sirianni")

Eagles_df$Coach <- Coach
Eagles_df

aggregate(Eagles_df$Win.Pct, by = list(Eagles_df$Coach), FUN = mean)

# Create a plot of Win Percentage by Coach

# ggplot2 library
library(ggplot2)

avg_win_pct <- aggregate(Win.Pct ~ Coach, data = Eagles_df, FUN = mean)

# creating plot of average win percentage by Eagles coach
ggplot(avg_win_pct, aes(x = Coach, y = Win.Pct, fill = Coach)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Win Percentage by Coach", x = "Coach", "y = Average Win Percentage") + 
  geom_text(aes(label = round(Win.Pct, 1)), vjust = -0.5)
