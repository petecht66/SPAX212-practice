######################
# Identifying Underrated NBA Players (based on +/-)

# 1. Load player_comparisons frame
player_comparisons <- read.csv("https://raw.githubusercontent.com/petecht66/SPAX212-practice/refs/heads/main/data/player_comparison_NBA.csv") 

# Please note all players who played less than 100 minutes last season were excluded
# to make the estimates more reliable

# 2. Take a quick look at the player_comparisons
head(player_comparisons) #allows to see the first few rows of player_comparisons
names(player_comparisons) #allows to see all column names

# How many columns are in the player_comparisons set? What four advanced player stats are included?

# 3. Calculate summary statistics
mean(player_comparisons$PER, na.rm = TRUE)
median(player_comparisons$PER, na.rm = TRUE)
max(player_comparisons$PER, na.rm = TRUE)
min(player_comparisons$PER, na.rm = TRUE)
sd(player_comparisons$PER, na.rm = TRUE)

# Repeat for Plus_minus and record answers in your worksheet.

mean(player_comparisons$Plus_minus, na.rm = TRUE)
median(player_comparisons$Plus_minus, na.rm = TRUE)
max(player_comparisons$Plus_minus, na.rm = TRUE)
min(player_comparisons$Plus_minus, na.rm = TRUE)
sd(player_comparisons$Plus_minus, na.rm = TRUE)

# 4. Build a histogram

hist(player_comparisons$PER)

# Optinal: a little fancier

hist(player_comparisons$PER,
     main = "Distribution of NBA Efficiency",
     xlab = "NBA Efficiency",
     col = "lightblue", border = "black")


# 5. Create rank variables
# We will now create rank variables, ranking our PER and Plus_minus so that highest PER or Plus_Minus is ranked as #1 
# i.e., we are ranking them in the descending order
# Please note that by default, the rank() function ranks variables in ascending order. TO create a descending order
# we need to use a minus sign before our variable.

player_comparisons$Rank_PER <- rank(-player_comparisons$PER)

# Repeat for Plus_minus

player_comparisons$Rank_plus_minus <- rank(-player_comparisons$PER)


# Who has the highest PER?
player_comparisons$Player[player_comparisons$Rank_PER==1] #square brackets mean you are subsetting the player_comparisons - i.e., you are only looking at 
# the value of "Player" variable when Rank_PER variable equals to 1. Note how we are using "==" as equal sign here.

# Who has the highest Plus-minus?

player_comparisons$Player[player_comparisons$Rank_plus_minus==1]

# 6. Define an "Underrated Index"
# High if player looks good individually (PER) but not in plus-minus
player_comparisons$UnderratedIndex <- player_comparisons$Rank_plus_minus - player_comparisons$Rank_PER

# 7. Sort player_comparisons frame by Underrated Index from highest to lowest (descending)
player_comparisons_sorted <- player_comparisons[order(-player_comparisons$UnderratedIndex), ]

# 8. Save the new dataset

library(writexl)
write_xlsx(player_comparisons_sorted, "player_comparisons_with_ranks.xlsx")
write.csv(player_comparisons_sorted, "player_comparisons_with_ranks.csv")

