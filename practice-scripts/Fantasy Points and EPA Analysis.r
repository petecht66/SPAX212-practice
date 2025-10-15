library(readxl)
library(ggplot2)
library(patchwork)

df <- read.csv("https://raw.githubusercontent.com/petecht66/SPAX212-practice/refs/heads/main/data/QB%20weekly%20stats.csv")
summary(df)


# 1. Compute correlation between passing tds x fantasy points and rushing tds x fantasy points
round(cor(df$passing_tds, df$passing_epa, use = "complete.obs"), 2)
round(cor(df$passing_tds, df$fantasy_points, use = "complete.obs"), 2)


# 2. Do a scatter plot to visualize the relationship
 
# Scatterplot 1: Passing Tds vs Passing EPA
p1 <- ggplot(df, aes(x = passing_tds, y = passing_epa)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  geom_smooth(method = "lm") +
  labs(title = "Passing Touchdowns vs Passing EPA", x = "Passing Tds", y = "Passing EPA") +
  theme_bw()

# Scatterplot 2: Passing Tds vs Fantasy Points
p2 <- ggplot(df, aes(x = passing_tds, y = fantasy_points)) +
  geom_point(alpha = 0.6, color = "red") +
  geom_smooth(method = "lm") +
  labs(title = "Passing Touchdowns vs Fantasy Points", x = "Passing Tds", y = "Fantasy Points") +
  theme_bw()

# Combine side by side
p1 + p2



# Group workshop

# Group 1

# a. Modify code to assess correlations for (passing yards x fantasy points) and for (passing y/a x fantasy points)
# b. Make scatterplots to visualize the relationships
# c. Questions: 
#       What is more reflective of QB performance, passing yards or passing efficiency? 
#       As a critical thinker, what does this knowledge tell you about the accuracy of fantasy points? 
#       If you were a fantasy football team manager, how would this knowledge shape your approach to player selection?


# Group 2 

# a. Modify code to assess correlations for (interceptions x passing EPA) and for (interceptions x fantasy points)
# b. Make scatterplots to visualize the relationships
# c. Questions: 
#       What is more affected by interceptions - passing EPA or fantasy points? 
#       As a critical thinker, what does this knowledge tell you about the accuracy of fantasy points? 
#       If you were a fantasy football team manager, how would this knowledge shape your approach to player selection?

# Two correlations
round(cor(df$interceptions, df$passing_epa, use = "complete.obs"), 2)
round(cor(df$interceptions, df$fantasy_points, use = "complete.obs"), 2)

# Scatterplot 1: Interceptions vs Passing EPA
plot1 <- ggplot(df, aes(x = interceptions, y = passing_epa)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  geom_smooth(method = "lm") +
  labs(title = "Interceptions vs Passing EPA", x = "Interceptions", y = "Passing EPA") +
  theme_bw()

# Scatterplot 2: Interceptions vs Fantasy Points
plot2 <- ggplot(df, aes(x = interceptions, y = fantasy_points)) +
  geom_point(alpha = 0.6, color = "red") +
  geom_smooth(method = "lm") +
  labs(title = "Interceptions vs Fantasy Points", x = "Interceptions", y = "Fantasy Points") +
  theme_bw()

# Combine side by side
plot1 + plot2
