# Method 1: Select The File Manually
stats <- read.csv(file.choose())
stats

# Method 2: Set Working Directory and Read Data
getwd()
setwd('/home/rstudio')

stats <- read.csv('data/P2-Demographic-Data.csv')
stats
