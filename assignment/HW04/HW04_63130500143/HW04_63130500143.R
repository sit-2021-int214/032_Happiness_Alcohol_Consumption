
#library
install.packages("tidyverse")
library(dplyr)
library(readr)      
library(stringr)    
library(assertive)


#dataset
superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
View(superstore)

#view head
glimpse(superstore)
head(superstore,0)
superstore %>% head()

#select
superstore <- as_tibble(superstore)
superstore %>% select(Product.ID,Sales,Country)
superstore %>% select(-Product.ID,-Sales,-Country)

#filter
superstore <- as_tibble(superstore)
super <- superstore %>% select(Customer.Name,Category,Sales)
super %>% filter(Category == 'Furniture',Sales > 500)
super %>% filter(Category == 'Furniture' | Sales > 500)
super %>% filter(!(Category == 'Furniture'))

#Arrange
superstore <- as_tibble(superstore)
super <- superstore %>% select(Sub.Category ,Sales)
super %>% arrange(Sales)
super %>% arrange(desc(Sales))


#Slice
superstore %>% slice(5)
superstore %>% slice(5,8,15)
superstore %>% slice(5:10)
superstore %>% slice_head(n = 4)
superstore %>% slice_tail(n = 5)

#Summarise
superstore %>% summarise(avg_sales = mean(Sales, na.rm = TRUE), max_sales = max(Sales, na.rm = TRUE))

#relocate
superstore <- as_tibble(superstore)
superstore %>% relocate(Segment:City, .before = Customer.ID)

#stringr
fruit <- c("apple","orange","grape","banana","mango")
str_detect(fruit,"[mo]")

str_count(fruit,"[an]")

str_subset(fruit,"[n]")

str_locate(fruit,"[roe]")

str_extract(fruit,"[roe]")

str_match(fruit,"(.)[a](.)")

str_match(fruit,"[a](.)")

str_split(fruit, "")

#ggplot2
library(ggplot2)

ggplot(superstore, aes(Category,fill=Segment)) +
  geom_bar()


ggplot(superstore, aes(x=Sales,y=Sub.Category)) +
  geom_point(shape=21,fill="orange",color="orange",size =2)


