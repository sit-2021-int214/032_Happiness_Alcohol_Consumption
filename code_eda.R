
# ------------------Download Library and dataset---------------------

# Library
install.packages("readr")
install.packages("assertive")
install.packages("stringr")
library(readr)    
library(stringr)   
library(assertive)  
library(dplyr)

# Dataset
happiness <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/032_Happiness_Alcohol_Consumption/main/HappinessAlcoholConsumption.csv")
View(happiness)

# ---------------------Check & Cleaning Data -----------------------

# check data type
is.numeric(happiness$HappinessScore)
is.numeric(happiness$HDI)
is.numeric(happiness$GDP_PerCapita)
is.numeric(happiness$Beer_PerCapita)
is.numeric(happiness$Spirit_PerCapita)

# check duplicate
duplicated(happiness$Country)

# check range of happiness score
assert_all_are_in_closed_range(happiness$HappinessScore, lower = 0, upper = 10)

# change noth to north
happiness$Hemisphere <- replace(happiness$Hemisphere, happiness$Hemisphere == "noth", "north")


# -----------------------------Analyst--------------------------------

#----1----
happiness %>% group_by(Hemisphere) %>% select(HappinessScore) %>% summarise(avg = mean(HappinessScore))


#----2----

# max of beer
max_beer <- max(happiness$Beer_PerCapita)
happiness %>% dplyr::select(Beer_PerCapita, Country) %>% filter(Beer_PerCapita == max_beer)

# max of spirit
max_spirit <- max(happiness$Spirit_PerCapita)
happiness %>% dplyr::select(Spirit_PerCapita, Country) %>% filter(Spirit_PerCapita == max_spirit)
max_spirit

# max of wine
max_wine <- max(happiness$Wine_PerCapita)
happiness %>% dplyr::select(Wine_PerCapita, Country) %>% filter(Wine_PerCapita == max_wine) 

#----3----
happiness %>% group_by(Region) %>% summarise(avg = mean(HappinessScore))

#----4----
happiness %>% group_by(Region) %>% summarise(avg_beer = mean(Beer_PerCapita),avg_spirit = mean(Spirit_PerCapita),avg_wine = mean(Wine_PerCapita))

#----5----
happiness %>% group_by(Region) %>% select(GDP_PerCapita) %>% summarise(avg = mean(GDP_PerCapita)) %>% arrange(desc(avg))



