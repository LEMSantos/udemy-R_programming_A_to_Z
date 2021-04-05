stats <- read.csv('data/P2-Demographic-Data.csv')
stats

install.packages('ggplot2')
library(ggplot2)

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1), color=I('blue'))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom='boxplot')
