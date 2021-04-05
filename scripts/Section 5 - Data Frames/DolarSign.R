stats <- read.csv('data/P2-Demographic-Data.csv')
stats

head(stats)

stats[3,3]
stats[3, 'Birth.rate']
stats['Angola', 3] # You Can't Do That
stats$Internet.users # Same as stats[, "Internet.users"]
stats$Internet.users[2]
levels(stats$Income.Group)
