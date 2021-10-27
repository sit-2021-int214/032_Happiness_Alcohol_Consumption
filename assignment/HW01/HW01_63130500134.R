# Exercise 1
v1 <- c(10.4, 5.6, 3.1, 6.4, 21.7)
mean(v1) # average = 9.44
sum(v1) # sum = 47.2
median(v1) # median = 6.4
sd(v1) # sd = 7.33846

# Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

# 2.1
marvel_movie <- data.frame(names,years)
# Using data frame because keeping data in data frame make me easy to see the data when viewing it.
View(Marvel)

# 2.2
# The numbers of movies
length(names) # 27

# Finding the 19th movies name
names[19] # "Avengers: Infinity War"

# Which year is most released movies
# answer : 2017, 2021
mode(years)
