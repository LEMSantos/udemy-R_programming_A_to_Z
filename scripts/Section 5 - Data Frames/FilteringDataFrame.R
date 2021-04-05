stats <- read.csv('data/P2-Demographic-Data.csv')
stats

head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == 'High income',]

stats[stats$Country.Name == 'Malta',]
