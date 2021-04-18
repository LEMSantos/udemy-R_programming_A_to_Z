mov <- read.csv("data/Section6-Homework-Data.csv")

head(mov)
summary(mov)
str(mov)

#install.packages("ggplot2")
library(ggplot2)

ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

mov2 <- mov[filt & filt2,]

p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p

p + 
  geom_point()

p + 
  geom_boxplot()

p + 
  geom_boxplot() + 
  geom_point()

p + 
  geom_boxplot() + 
  geom_jitter()

p + 
  geom_jitter() + 
  geom_boxplot() 

p + 
  geom_jitter() + 
  geom_boxplot(alpha=0.7) 

p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7) 

p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 

q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA, size=0.5) 
q

q <- q +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
q

?theme

q <- q + 
  theme(
    text = element_text(family="Comic Sans MS"),
    
    axis.title.x = element_text(colour="Blue", size=12),
    axis.title.y = element_text(colour="Blue", size=12),
    axis.text.x = element_text(size=10),
    axis.text.y = element_text(size=10),  
    
    plot.title = element_text(colour="Black",
                              size=16,
                              hjust=0.5),
    
    legend.title = element_text(size=10),
    legend.text = element_text(size=8)
  )
q

q$labels$size = "Budget $M"
q
