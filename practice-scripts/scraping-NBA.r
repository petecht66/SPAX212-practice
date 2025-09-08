# libraries needed for this script
library(hoopR)
library(writexl)

# creating 2024 NBA data frame
NBA2024 <- load_nba_schedule(seasons = 2024)

# viewing the first entries of the data frame
head(NBA2024)

# Write is as an Excel file in .xlsx and .csv forms
write_xlsx(NBA2024, "NBA_2024_Schedule.xlsx")
write.csv(NBA2024, "NBA_2024_Schedule.csv")