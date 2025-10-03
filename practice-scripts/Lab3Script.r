# Packages/libraries needed for this script
library(ggplot2)
library(readxl)

data <- read_excel("Pitching_2025.xlsx")

summary(data)

# 1. Basic plot

ggplot(data, aes(x = ERA, y=WAR)) +
  geom_point() 

ggplot(data, aes(x = ERA, y=WAR)) +
  geom_smooth()

ggplot(data, aes(x = ERA, y=WAR)) +
  geom_text(aes(label = Player)) 

# 2. Edit color and transparency of your points

ggplot(data, aes(x = ERA, y=WAR)) +
  geom_point(color = "red")


ggplot(data, aes(x = ERA, y=WAR)) +
  geom_point(color = "red", alpha = 0.5)


# 3. Add a trend-line. Default setting is a smooth trend line
ggplot(data, aes(x = ERA, y=WAR)) +
  geom_point(color = "red", alpha = 0.7) +
  geom_smooth() 


# 4. Specify method = "lm" to get a regression line
ggplot(data, aes(x = ERA, y=WAR)) +
  geom_point(color = "red", alpha = 0.7) +
  geom_smooth(method = "lm")


# 5. Color by the number of home runs allowed
ggplot(data, aes(x = ERA, y=WAR, color = HR)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm")



# 6. Color by the number of home runs allowed
ggplot(data, aes(x = ERA, y=WAR, color = HR)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm") +
  scale_color_gradient(low = "blue", high = "yellow")


# 7. Edit your axis
ggplot(data, aes(x = ERA, y=WAR, color = HR)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm") +
  scale_color_gradient(low = "blue", high = "yellow") +
  xlim(0, 10)

# 8. Add the main title
ggplot(data, aes(x = ERA, y=WAR, color = HR)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm") +
  scale_color_gradient(low = "blue", high = "yellow") +
  xlim(0, 10) + 
  labs(title = "Relationship between ERA and WAR", color = "Home Runs")


# 9. Change the theme
ggplot(data, aes(x = ERA, y=WAR, color = HR)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm") +
  scale_color_gradient(low = "blue", high = "yellow") +
  xlim(0, 10) + 
  labs(title = "Relationship between ERA and WAR", color = "Home Runs") +
  theme_dark()




###############################################
# Examining the relationship between IP and WAR
###############################################

# Create a plot visualizing the relationship between innings pitched IP (independent variable) and WAR (dependent variable). 
# - Set the color of points to "cyan", 
# - Set transparency (alpha) to 0.7. 
# - Add a red smooth trend line. 
# - Add a title.




# What kind of relationship is this (positive, negative, no relationship)? Please interpret.





###########################
# [Optional - regression to examine which statistics actually "matter" ]
model1 <- lm(WAR ~ ERA + IP + HR + HBP + BB + SO, data = data)
summary(model1)