# Exercise1 Finding the average, sum, median, sd, variance of 10.4, 5.6, 3.1, 6.4, 21.7

q1 <- c(10.4,5.6,3.1,6.4,21.7)

mean(q1) #9.44
sum(q1)  #47.2
median(q1) #6.4
sd(q1)  #7.33846
var(q1)  #53.853

#Exercise 2
#2.1. Create data structure in variable named marvel_movies and explain why you using this data structure ?

name <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

marvel_movies <-data.frame(name,years)
View(marvel_movies)

#Answer2.1 use Data Frame to correct name and years of the movies because it will show your data in a form of table and it easy to read


#2.2 Finding the information:
#2.2.1 The numbers of movies
length(marvel_movies) #27

#2.2.2 Finding the 19th movies name
marvel_movies[19] #Avengers: Infinity War

#2.2.3 Which year is most released movies (In this question can using observation data, not necessary to used command to find answer) 
summary(as.factor(years)) #2017 and 2021





