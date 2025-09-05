library(hoopR)
library(writexl)

NBA2024 <- load_nba_schedule(seasons = 2024)

# Write is as an Excel file in .xlsx and .csv forms
write_xlsx(NBA2024, "NBA_2024_Schedule.xlsx")
write.csv(NBA2024, "NBA_2024_Schedule.csv")