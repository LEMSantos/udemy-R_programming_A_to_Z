stats <- read.csv('data/P2-Demographic-Data.csv')
stats

# Subsetting
stats[1:10,]
stats[3:9,]
stats[c(4,100),]

# Remember how [] work
is.data.frame(stats[1,]) # No need for drop=F
is.data.frame(stats[,1])
is.data.frame(stats[, 1, drop=F])

# Multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# Add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

# Test of Knowledge
stats$xyz <- 1:5
head(stats, n=12)

# Remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)
