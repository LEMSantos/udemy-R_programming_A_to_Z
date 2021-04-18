mov <- read.csv("data/Section6-Homework-Data.csv")

head(mov)
summary(mov)
str(mov)

#install.packages("ggplot2")
library(ggplot2)

filt <- mov$Genre %in% c("action", "adventure", "animation", "comedy", "drama")

filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

mov2 <- mov[filt & filt2,]

p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA, size=0.5) 

q <- q +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

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

q$labels$size = "Budget $M"

q
