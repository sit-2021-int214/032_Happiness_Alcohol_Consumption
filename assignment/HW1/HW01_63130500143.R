#Exercise 1
x <- c(10.4,5.6,3.1,6.4,21.7)
x
mean(x)
sum(x)
median(x)
var(x)
sd(x)

#Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

marvel_movies <- data.frame(names,years)
View(marvel_movies)
#use data frame because it's easy to look

length(names)
names[19]
marvel_movies[19]
getmode <- function(v) {
  uniqv <- unique(v)
  tabulate_x <- tabulate(match(v, uniqv))
  uniqv[tabulate_x == max(tabulate_x)]
}
v <- getmode(years)
v
