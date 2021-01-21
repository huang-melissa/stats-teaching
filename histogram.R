getwd()

#set your working directory
setwd("/Users/mellyzors/Desktop/Data science")

#check if file is in current directyory
dir()

#install and load
##install.packages(readxl)
library(readxl)

#import the excel data into R as 'exams'
exams <- read_excel("examscores.xlsx", sheet = 1, col_types = c("numeric"), col_names = TRUE)

exams

#see what you can do with histograms
?hist()

#create a quick and dirty histogram
h1 <- hist(exams$score)

h1

#let's define our bin edges
hbins <- c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

#let's also define a title and labels for axes

title <- 'Exam scores for Psychological Statistics Fall 2019'
hxlab <- 'Exam score'
hylab <- 'Number of students'

#now let's build the histogram with more customizations
h2 <- hist(exams$score, main=title,
     xlab=hxlab, ylab=hylab, xlim=c(0,100), col='turquoise', breaks= hbins, labels = TRUE)

h2


#let's plot 2 datasets on the same histogram, we will use another package on R 'ggplot2'
##the datafile will be in the same wd

#install and load
##install.packages('ggplot2')
library(ggplot2)

#import the excel data into R as 'exams'
exams <- read_excel("examscores.xlsx", sheet = 1, col_types = c("numeric"), col_names = TRUE)
title1 <- 'Exam 1 scores among students in Introductory Psychology'
hxlab1 <- 'Exam Score'
hylab1 <- 'Number of students'

ggplot(data=exams, aes(exams$score)) +
  geom_histogram(binwidth=8, col='pink', fill='turquoise', alpha=.5, position = 'identity') + ggtitle(title1) + xlab(hxlab1) + ylab(hylab1) +
  xlim(c(20,100)) + ylim(c(0,10))

#load the excel data
class1 <- read_excel("quizzes.xlsx", sheet = 1, col_types = c("numeric"), col_names = TRUE)
class2 <- read_excel("quizzes.xlsx", sheet = 2, col_types = c("numeric"), col_names = TRUE)

# Now, combine the two dataframes into one.
##make a new column that will be a variable to identify the class the score corresponds to
class1$class <- 'class 2'
class2$class <- 'class 1'

# and combine into your new data frame vegLengths
quizscores <- rbind(class1, class2)

#define titles and axis labels
title2 <- 'Quiz scores among students in Psychology classes'
hxlab2 <- 'Quiz score'
hylab2 <- 'Number of students'

#plot it
p <- ggplot(quizscores, aes(score, fill = class)) +
  geom_histogram(binwidth=1, alpha = 0.5, position = 'identity') +
  geom_text(stat='count', aes(label=..count..))

p + ggtitle(title2) + xlab(hxlab2) + ylab(hylab2)
