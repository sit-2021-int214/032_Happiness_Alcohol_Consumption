# Library
library(readr)
library(dplyr)
library(stringr)
library(ggplot2)

# dataset
books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# viewdataset
glimpse(books)

# learn tidyverse
books %>% select(Book_title, Type)
books %>% filter(Type == "Paperback")
books %>% arrange(Price)
books %>% arrange(desc(Price))
books %>% select(Type) %>% group_by(Type)
books %>% group_by(Type) %>% count()
books %>% group_by(Type)
books %>% mutate(vat = Price*0.07)
books %>% distinct(Type)

# insight

books %>% group_by(Type) %>% count()

books %>% filter(Reviews==0) %>% select(Book_title,Type)  

books %>% filter(Rating>4.5) %>% select(Book_title,Rating) 

books %>% filter(Price>=30, Price<=35, Type == "Paperback") %>% select(Book_title,Price) 

books %>% select(Book_title,Price) %>% arrange(desc(Price)) %>% head(n = 10L)

books %>% filter(Rating > mean(Rating, na.rm = TRUE)) %>% group_by(Type) %>% count()

# graph
graph<- ggplot(books,aes(x=Type)) + geom_bar()
graph
graph + ggtitle("Graph show the number of book in each type") + xlab("Type") + ylab("number of book")


graph2 <- books %>% filter(Number_Of_Pages<1500) %>% ggplot(aes(x=Number_Of_Pages,y=Price))+
  geom_point(aes(color=Type))+ ggtitle("relation between Number Of pages and Price")
graph2
