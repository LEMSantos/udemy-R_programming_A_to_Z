install.packages('ggplot')
install.packages('here')

library(ggplot2)
library(here)

stats <- read.csv('data/P2-Demographic-Data.csv')
stats

source(here::here('scripts', 'Section 5 - Data Frames', 'CountryRegionVectors.R'))

mydf <- data.frame(Countries_2012_Dataset,
                   Codes_2012_Dataset,
                   Regions_2012_Dataset)

colnames(mydf) <- c('Country', 'Code', 'Region')
head(mydf)

rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset,
                   Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)

head(mydf)
summary(mydf)

# ------------------------------ Merging Data Frames

head(stats)
head(mydf)

merged <- merge(x=stats, y=mydf, by.x='Country.Code', by.y='Code', all.y=TRUE)
head(merged)

merged$Country <- NULL
str(merged)

head(merged)

# ------------------------------ Visualizing With New Split

qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)

# 1. Shapes

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, shape=I(17))
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, shape=I(2))
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, shape=I(15))
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, shape=I(23))

# 2. Transparency

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, shape=I(19),
      alpha=I(0.6))

# 3. Title

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, shape=I(19),
      alpha=I(0.6), main='Birth Rate vs Internet Users')
