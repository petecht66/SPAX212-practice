################
# Warm-Up

# 1. Perform calculations by running the following three lines of code. (Place cursor on each respective line 
# and click the "Run" button)
1+1+1+1+1+1 #number of games in one set in tennis
40/2 #length of one half in college basketball
12*4 #length of a NBA basketball game (without overtime)
(12*4)+5 #length of a NBA game with one overtime

# 2. Your turn: imagine a player scores 6 points in the first quarter and 12 in the second
# Write a command to estimate the total number of points (i.e., sum up 6 and 12)
total_points <- 6+12
total_points

# 3. A basketball court is 94 feet long. Write a command to estimate the total length of seventeen basketball courts
total_length <- 94*17
total_length

# 4. ^ means "to the power of". Run the code below
3^2

# 5. Your turn: calculate 9 squared
9^2

#########################
# Estimating win % for Phillies

# 1. As of September 24, 2025, Phillies won 93 and lost 65 games this season. Let's estimate their win percentage (win %)
# First, create a new variable "wins"
W <- 93 

# Your turn - write code to create variable "losses". Name this variable "L"
L <- 65

# 2. Estimate win percentage
W.Pct <- 100*W / (W + L)

W.Pct #run this line of code to see the value of Phillies' win %


# 4. As of September 24, 2025, NY Mets' won 81 games and lost 77 games this season. Now, estimate their win percentage 
# below using similar commands as you did for Phillies above.
wins_Mets <- 81
losses_Mets <- 77
games_played <- (wins_Mets + losses_Mets)
win_percentage_Mets <- 100 * (wins_Mets / games_played)
win_percentage_Mets

##########################
# Comparing Points Per Minute and +/- for NBA players

# 1. First, save file "Homework 1 Dataset.xlsx" in your working directory folder.
# Please make sure that you have a proper Working Directory set.

# Let's open the file - you can open the file by just running the line of code below. 

install.packages("readxl")
library(readxl)
data <- read_excel("Homework 1 Dataset.xlsx")

head(data)
names(data)



# 2. Let's create a new column, calculating field goal percentage (FG%), by dividing field goals made (FG) by field 
# goals attempted (FGA)

data$FG_PCT <- data$FG/data$FGA


# 3. Describe the variable using descriptive statistics:

mean(data$FG_PCT)
median(data$FG_PCT)
max(data$FG_PCT)
min(data$FG_PCT)
sd(data$FG_PCT)

# 4. Create a histogram for FG%:
hist(data$FG_PCT)


# 5. Now - your turn. Write code to create a variable "points per minute" (Points_per_minute) by dividing the number of points 
# scored (PTS) by the total number of minutes played (MP)



# 6. Write code to estimate descriptive statistics for points per minute, including: a) mean, b) median, c) max, d) min, e) sd




# 7. Write code to create a histogram for points per minute

