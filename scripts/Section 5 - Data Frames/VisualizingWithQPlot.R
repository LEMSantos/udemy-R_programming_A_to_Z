stats <- read.csv('data/P2-Demographic-Data.csv')
stats

library(ggplot2)

qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(1))
qplot(data=stats, x=Internet.users, y=Birth.rate, color=I('red'), size=I(1))
qplot(data=stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(1))
