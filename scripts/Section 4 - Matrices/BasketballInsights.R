library(here)
source(here::here('scripts', 'Section 4 - Matrices', 's4-BasketballData.R'))
source(here::here('scripts', 'Section 4 - Matrices', 'FirstFunction.R'))

# Salary
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)

# In-Game Metrics
myplot(MinutesPlayed)
myplot(Points)

# In-Game Metrics Normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points / Games)

# Time is valuable
myplot(FieldGoals / MinutesPlayed)

# Player Style
myplot(Points / FieldGoals)
