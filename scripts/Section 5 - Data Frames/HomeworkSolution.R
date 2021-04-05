library(ggplot2)
library(here)

world.trends.data <- read.csv('data/P2-Section5-Homework-Data.csv')
head(world.trends.data)

data.1960 <- world.trends.data[world.trends.data$Year == 1960,]
data.2013 <- world.trends.data[world.trends.data$Year == 2013,]

source(here::here('scripts', 'Section 5 - Data Frames', 'Section5-Homework-Vectors.R'))

life.expectancy.1960 <- data.frame(Country.Code=Country_Code,
                                   Life.Expectancy=Life_Expectancy_At_Birth_1960)
life.expectancy.2013 <- data.frame(Country.Code=Country_Code,
                                   Life.Expectancy=Life_Expectancy_At_Birth_2013)

data.1960 <- merge(data.1960, life.expectancy.1960, by='Country.Code')
data.2013 <- merge(data.2013, life.expectancy.2013, by='Country.Code')

qplot(data=data.1960, x=Fertility.Rate, y=Life.Expectancy, color=Region,
      size=I(1), main='Fertility Rate vs Life Expectancy - 1960')
qplot(data=data.2013, x=Fertility.Rate, y=Life.Expectancy, color=Region,
      size=I(1), main='Fertility Rate vs Life Expectancy - 2013')
