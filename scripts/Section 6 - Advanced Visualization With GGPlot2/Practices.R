movies <- read.csv('data/P2-Movie-Ratings.csv')

colnames(movies) <- c('Film', 'Genre', 'CriticRating', 'AudienceRating', 'BudgetMillions', 'Year')

movies$Year <- factor(movies$Year)
movies$Genre <- factor(movies$Genre)
movies$Film <- factor(movies$Film)

head(movies)
str(movies)
summary(movies)


#----------------------- Aesthetics


library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) +
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=Genre)) +
  geom_point()

#add size - better way
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()


#----------------------- Plotting With Layers


p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))

# point
p + geom_point()

# line
p + geom_line()

# multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()


#----------------------- Overriding Aestherics


q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))

# add geom layer
q + geom_point()

# overriding aes
# example 1
q + geom_point(aes(size=CriticRating))

# example 2
q + geom_point(aes(colour=BudgetMillions))

# q remains the same
q + geom_point()

# example 3
q + geom_point(aes(x=BudgetMillions)) + xlab('Budget Millions $$$')

# example 4
p + geom_line() + geom_point()
# reduce line size
q + geom_line(size=1) + geom_point(size=1)


#----------------------- Mapping vs Setting


r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# Add colour
# 1. Mapping (what we've done so far):
r + geom_point(aes(colour=Genre))
# 2. Setting:
r + geom_point(colour='DarkGreen')
# ERROR
# r + geom_point(aes(colour='DarkGreen'))

# 1. Mapping
r + geom_point(aes(size=BudgetMillions))
# 2. Setting
r + geom_point(size=10)
# ERROR
r + geom_point(aes(size=10))


#----------------------- Histograms and Density Charts


s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

# add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))
# add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
# >>> 3 (we will improve it)

# sometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")


#----------------------- Starting Layer Tips


t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Blue")

# another way:
t <-ggplot(data=movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating), fill="White", colour="Blue")

# >>> 4

t + geom_histogram(binwidth=10, aes(x=CriticRating), fill="White", colour="Blue")

# >>> 5


#----------------------- Statistical Transformations


?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point(size=0.5) + geom_smooth(fill=NA, size=0.5)

# boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=0.5)
u + geom_boxplot(size=0.5) + geom_point(size=0.5)
# tip / hack:
u + geom_boxplot(size=0.5) + geom_jitter(size=0.5)
# another way:
u + geom_jitter(size=0.5) + geom_boxplot(size=0.5, alpha=0.5)

# >>> 6

u <- ggplot(data=movies, aes(x=Genre, y=CriticRating, colour=Genre))
u + geom_jitter(size=0.5) + geom_boxplot(size=0.5, alpha=0.5)


#----------------------- Using Facets


v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# facets:
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") + 
  facet_grid(Genre~., scales="free")

# scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=0.5) + facet_grid(Genre~.)
w + geom_point(size=0.5) + facet_grid(.~Year)
w + geom_point(size=0.5) + facet_grid(Genre~Year)
w + geom_point(size=0.5) + geom_smooth(size=0.5) + facet_grid(Genre~Year)
w + geom_point(aes(size=BudgetMillions)) + geom_smooth(size=0.5) + facet_grid(Genre~Year)

# >>> 1 (but still will improve)


#----------------------- Coordinates


# Today:
# limits
# zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, colour=Genre))
m + geom_point(size=0.5)
m + geom_point(size=0.5) + xlim(50, 100) + ylim(50, 100)

# won't work well always
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  ylim(0, 50)

# instead - zoom
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0,50))


# improve #1
w + geom_point(aes(size=BudgetMillions)) + geom_smooth(size=0.5) +
  facet_grid(Genre~Year) + coord_cartesian(ylim=c(0,100))


#----------------------- Themes


o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# axis label
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=12),
        axis.title.y=element_text(colour="Red", size=12))


# tick mark formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=12),
        axis.title.y=element_text(colour="Red", size=12),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10))

?theme

# legend formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=12),
        axis.title.y=element_text(colour="Red", size=12),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        
        legend.title=element_text(size=12),
        legend.text=element_text(size=10),
        legend.position=c(1,1),
        legend.justification=c(1,1))


# title
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=12),
        axis.title.y=element_text(colour="Red", size=12),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        
        legend.title=element_text(size=12),
        legend.text=element_text(size=10),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        
        plot.title=element_text(colour="DarkBlue",
                                size=16,
                                family="Courier",
                                hjust=0.5))
