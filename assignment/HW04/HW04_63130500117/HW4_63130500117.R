## PART I

# Install package
install.packages("dplyr")
install.packages("readr")
install.packages("stringr")
install.packages("ggplot2")
# Library
library(dplyr)
library(readr)
library(stringr)
library(ggplot2)
# Data set
superstore <- read.csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv')

## PART II

library(dplyr) #if you didn't call it
#select()
superstore %>% select(Order.ID,State,City)
#filter()
superstore %>% filter( Customer.Name == "Claire Gute") %>% as_tibble(superstore)
#arrange()
superstore %>% select(Order.ID,State,City) %>% arrange(State)
#group_by()
superstore %>% group_by(Order.ID)
#as_tibble()
as_tibble(superstore)

## PART III

#1 Find the Maximum sales from Category furniture
maxs <- superstore %>% select(Category,Sales) %>% filter(Category == "Furniture")
max(maxs$Sales)

#2 Find the number of order that customer name is "Brosina Hoffman"
idBrosina <- superstore %>% select(Order.ID,Customer.ID,Customer.Name) %>% filter(Customer.Name == "Brosina Hoffman")
count(idBrosina)

#3 Find the product name that have the most sale in this dataset.
maxSales <- superstore %>% select(Product.Name,Sales) %>% group_by(Product.Name) %>% summarise(totalSale = sum(Sales)) %>% filter(totalSale == max(totalSale ))
maxSales
#4 list the region of superstore and not duplicated
superstore %>% select(Region) %>% distinct(Region)

#5 Find product name that have orderdate in 2018
prod2018 <- superstore %>% mutate(year = year(dmy(superstore$Order.Date))) %>% filter(year==2018) %>% select(year,Category,Product.Name)
as_tibble(prod2018)

#6 Find minimum sales in Kentucky
saleKent <- superstore %>% filter(State == "Kentucky")
min(saleKent$Sales)

## PART IV

#1 Graph show proportional division of region

ggplot(superstore ,aes(x="",fill = Region)) + geom_bar(width = 1) + coord_polar("y")

#2 Graph show Category and the number of data that specific as sub-category in data set

ggplot(superstore,aes(y = `Category`)) + 
  geom_bar(aes(fill = `Sub.Category`))
