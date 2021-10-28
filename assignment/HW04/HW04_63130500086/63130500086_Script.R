#Part 1
# Library
library(readr)
library(assertive)
library(stringr)
library(dplyr)
library(tidyr)
library(ggplot2)

# Dataset
prog_book <- read.csv("prog_book.csv")

# View dataset
glimpse(prog_book)
View(prog_book)

# Part 2

prog_book %>% select(Book_title, Rating , Reviews)

prog_book %>% filter(Price > 50) %>% select(Book_title, Price)

prog_book %>% select(Rating, Book_title) %>% arrange(Rating)

prog_book %>% group_by(Type) %>% summarise(sum_reviews = sum(as.numeric(Reviews), na.rm = TRUE))

prog_book %>% mutate(Bath = Price*33)

ggplot(prog_book, aes(x=Rating)) + geom_bar()

# Part 3

# 1. Maximum and Minimum of Price in each type of book
prog_book %>% group_by(Type) %>% select(Type, Price) %>% summarise(Max = max(Price), Min = min(Price))

# 2. Average number of pages in each type of book
prog_book %>% group_by(Type) %>% select(Type, Number_Of_Pages) %>% summarise(avg = mean(Number_Of_Pages))

# 3. Average of Price in each type of book
prog_book %>% group_by(Type) %>% select(Type, Price) %>% summarise(avg = mean(Price))

# 4. Books with less than 50 reviews
prog_book %>%  filter(Reviews == 0) %>% group_by(Book_title) %>% select(Book_title , Reviews)

# 5. Ratings and prices of e-book with the Max Rating
ebook <- prog_book %>% filter(Type == 'ebook')
Max_rating <- max(ebook$Rating)
prog_book %>% filter(Rating == Max_rating) %>% select(Book_title , Rating , Reviews ,Price)

# 6. Average number of pages in each type of book
prog_book %>% group_by(Type) %>% select(Type, Number_Of_Pages) %>% summarise(avg = mean(Number_Of_Pages))

# 7. List book title and price of all books for beginner
text <- str_subset(books$Book_title, "JavaScript")
prog_book %>% filter(Book_title %in% text) %>% select(Book_title)

# Part 4
# 1.) Graph show the number of books in each type
books_bar <- ggplot(prog_book, aes(x=Type, fill=Type )) + 
  geom_bar( ) +
  scale_fill_hue(c = 40) 
books_bar

books_bar + ggtitle("Number of books in each type") +
  xlab("Type") + ylab("number of books")

# 2.) Graph show relation between rating and price
prog_book %>% ggplot(aes(x=Rating,y=Price))+geom_point()
prog_book %>% filter(Price<150) %>% ggplot(aes(x=Rating,y=Price))+geom_point()
books_scatter <- prog_book %>% filter(Price<150) %>% ggplot(aes(x=Rating,y=Price))+geom_point()+
  geom_point(aes(color=Type))

books_scatter

books_scatter + geom_smooth() 
books_scatter + geom_smooth(method="lm") #linear model
