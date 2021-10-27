
# Library
library(dplyr)
library(ggplot2)

# Dataset
books <- read.csv("prog_book.csv")

# View dataset
glimpse(books)
View(books)

# Part 2 ::
books %>% select(Rating, Book_title, Price)
table(books$Rating)

books %>% filter(Rating > 4) %>% select(Rating, Book_title, Price)

books %>% select(Rating, Book_title, Price) %>% arrange(Rating)

books %>% mutate(Price_TH = Price*33)

books %>% group_by(Type) %>% summarise(sum_reviews = sum(as.numeric(Reviews), na.rm = TRUE))

ggplot(books, aes(x=Type)) + geom_bar()

# Part 3 ::
# 1.Average of rating in each type of book
books %>% group_by(Type) %>% select(Type, Rating) %>% summarise(avg = mean(Rating))

# 2.Maximum and minimum of rating in each type of book
books %>% group_by(Type) %>% select(Type, Rating) %>% summarise(max = max(Rating), min = min(Rating))

# 3.Rating that more than 4 have the average price is
books %>% filter(Rating > 4) %>% summarise(avg = mean(Rating))

# 4.Rating and price of hardcover book that has maximum reviews
hardcover_book <- books %>% filter(Type == 'Hardcover')
max_review <- max(hardcover_book$Reviews)

hardcover_book %>% filter(Reviews == max_review) %>% select(Book_title, Rating, Price)

# 5.Average number of pages in each type of book
books %>% group_by(Type) %>% select(Type, Number_Of_Pages) %>% summarise(avg = mean(Number_Of_Pages))

# 6.Average of price that book has the number of pages between 300 and 400
books %>% filter(Number_Of_Pages > 300, Number_Of_Pages < 400) %>% summarise(avd_price = mean(Price))

books %>% filter(Rating>3.5 && Reviews >'1000') %>% select(Rating,Reviews) 

# 7.Count of book that has rating less than 4 in each type 
books %>% filter(Rating < 4) %>% group_by(Type) %>% count(sort = TRUE)

# Part 4 ::
# 1
# Step 1: Creating a basic Bar Graph
# Save to object
books_bar<- ggplot(books, aes(x=Type, fill=Type )) + 
  geom_bar( ) +
  scale_fill_hue(c = 40) 

books_bar

# Adding component
books_bar + ggtitle("Number of books in each type") +
  xlab("Type") + ylab("number of books")


# 2
# Step 1: Creating a scatter plot
books %>% ggplot(aes(x=Rating,y=Price))+geom_point()

# Step 2: Using filter data to expand more details
books %>% filter(Price<150) %>% ggplot(aes(x=Rating,y=Price))+geom_point()

# Step 3: Label type with color
books_scatter <- books %>% filter(Price<150) %>% ggplot(aes(x=Rating,y=Price))+geom_point()+
  geom_point(aes(color=Type))

books_scatter

# Step 4: Adding a line of best fit to a plot
books_scatter + geom_smooth() 
books_scatter + geom_smooth(method="lm") #linear model

books %>% select(sum(Rating))

