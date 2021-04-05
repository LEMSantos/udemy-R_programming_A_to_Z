library(here)
source(here::here('scripts', 'Section 4 - Matrices', 's4-BasketballData.R'))

Games
rownames(Games)
colnames(Games)
Games['LeBronJames', '2012']

FieldGoals

round(FieldGoals / Games, 1)

round(MinutesPlayed / Games)
