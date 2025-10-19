#########
# Warm-Up
#########

# 1. In the 2025 regular season, Baltimore Orioles had 677 runs scored and 788 runs allowed. 
# Let's estimate their expected win% based on Pythagorean expectation with an exponent of 1.83:

# First, let's create Runs Scored and Runs Allowed variables:
Orioles_RS <- 677
Orioles_RA <- 788

Orioles_P_Exp <- Orioles_RS^1.83/(Orioles_RS^1.83 + Orioles_RA^1.83)

# Run this line of code to see the estimation
Orioles_P_Exp

# 2. Now, your turn. 
#    Estimate Pythagorean Expectation for the New York Yankees, who scored 849 runs and allowed 685 runs
Yankees_RS <- 849
Yankees_RA <- 685

Yankees_P_Exp <- Yankees_RS^1.83/(Yankees_RS^1.83 + Yankees_RA^1.83)
Yankees_P_Exp

####################
# NY Mets Case Study
###################


# Save the dataset "Homework 2 Dataset" in your Working Directory folder.
# Make sure the right folder is set up as your working directory in R


# Then, load the dataset into a dataframe "data"
# install.packages("readxl") #only run this line if you have not installed the package before. Remove "#" to run it
data <- read.csv("https://raw.githubusercontent.com/petecht66/SPAX212-practice/refs/heads/main/data/Homework%202%20Dataset.csv")

# Inspect the dataset
names(data)
summary(data)


# 1. Run this line of code to create a new column that will display Pythagorean Expectation calculated with an exponent of 1.83.

data$P_Exp <- data$RS^1.83/(data$RS^1.83 + data$RA^1.83)

#Inspect the new variable
summary(data$P_Exp)


# 2. Write code to create a new variable that will display the Win percentage for 2025. Name it PCT.
#    Hint: Win% equals to the number of wins divided by the total number of games played (sum of wins and losses)

data$total_games <- data$W + data$L
data$PCT <- (data$W/data$total_games)


# 3. Write code to create a new variable to estimate the luck differential (i.e., subtract Pythagorean Expectation from win%)

data$Luck_diff <- (data$PCT - data$P_Exp)
  

###After completing the code, proceed to Part II in the worksheet

write.csv(data, "Pythagorean Expectation Data.csv")