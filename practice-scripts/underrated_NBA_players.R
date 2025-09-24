######################
# Identifying Underrated NBA Players (based on +/-)

# 1. Load data frame
data <- Player_comparison 

# Please note all players who played less than 100 minutes last season were excluded
#to make the estimates more reliable

# 2. Take a quick look at the data
head(data) #allows to see the first few rows of data
names(data) #allows to see all column names

# How many columns are in the dataset? What four advanced player stats are included?

# 3. Calculate summary statistics
mean(data$PER, na.rm = TRUE)
median(data$PER, na.rm = TRUE)
max(data$PER, na.rm = TRUE)
min(data$PER, na.rm = TRUE)
sd(data$PER, na.rm = TRUE)

# Repeat for Plus_minus and record answers in your worksheet.

# 4. Build a histogram

hist(data$PER)

# Optinal: a little fancier

hist(data$PER,
     main = "Distribution of NBA Efficiency",
     xlab = "NBA Efficiency",
     col = "lightblue", border = "black")


# 5. Create rank variables
# We will now create rank variables, ranking our PER and Plus_minus so that highest PER or Plus_Minus is ranked as #1 
# i.e., we are ranking them in the descending order
# Please note that by default, the rank() function ranks variables in ascending order. TO create a descending order
# we need to use a minus sign before our variable.

data$Rank_PER <- rank(-data$PER)

# Repeat for Plus_minus


# Who has the highest PER?
data$Player[data$Rank_PER==1] #square brackets mean you are subsetting the data - i.e., you are only looking at 
# the value of "Player" variable when Rank_PER variable equals to 1. Note how we are using "==" as equal sign here.

# Who has the highest Plus-minus?


# 6. Define an "Underrated Index"
# High if player looks good individually (PER) but not in plus-minus
data$UnderratedIndex <- (data$Rank_PM - data$Rank_PER)

# 7. Sort data frame by Underrated Index from highest to lowest (descending)
data_sorted <- data[order(-data$UnderratedIndex), ]

# 8. Save the new dataset

library(writexl)
write_xlsx(data_sorted, "Data_with_ranks.xlsx")

