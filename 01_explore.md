# Happiness Alcohol Consumption
Datasets from: https://www.kaggle.com/marcospessotto/happiness-and-alcohol-consumption

### Steps
1. Define a question
2. Download Library and dataset
3. Explore the dataset from the original dataset
4. Cleaning Dataset
5. Exploratory Data Analysis

## Step1: Define a question

1. หาค่าเฉลี่ยของ Happy Score ของการดื่มแอลกอฮอล์ (เบียร์ เหล้า ไวน์) ในเเต่ละซีกโลก
2. หาว่าประเทศไหนมีการกินแอลกอฮอล์ในแต่ละประเภทมากที่สุด
3. หาค่าเฉลี่ย Happiness score ในเเต่ละ region เเล้วนํามาเทียบกัน
4. หาค่าเฉลี่ยการกินเเอลกอฮอล์เเต่ละประเภทในเเต่ละภูมิภาค 
5. หาค่าเฉลี่ยดัชนีผลิตภัณฑ์มวลรวมภายใน (GDP) ของเเต่ละภูมิภาค เเละนำมาเปรียบเทียบหาภูมิภาคที่มี GDP เฉลี่ยสูงสุดเเละต่ำสุด


## Step2: Download Library and dataset
```
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
```
## Step3: Explore the dataset from the original dataset
ใน dataset นี้ประกอบด้วยข้อมูลทั้งหมด 9 คอลัมน์คือ 
1. Country 
     - ประกอบด้วยรายชื่อประเทศทั้งหมด 122 ประเทศที่เเตกต่างกัน
     - ข้อมูลเป็นประเภท character
2. Region	
     - ประกอบด้วยรายชื่อ region ทั้งหมด 9 region
     - ข้อมูลเป็นประเภท character
3. Hemisphere 
     - ซีกโลก เเบ่งออกเป็นสามอย่างคือ north south เเละ both
     - ข้อมูลเป็นประเภท character
4. HappinessScore 
     - เกณฑ์วัดระดับความสุข ตั้งเเต่ 0-10
     - ข้อมูลเป็นประเภท double
5. HDI	
     - Human Development Index by United Nations Development Programme
     - ข้อมูลเป็นประเภท integer
6. GDP_PerCapita	
     - Gross Domestic Product index
     - ข้อมูลเป็นประเภท double
7. Beer_PerCapita	
     - Liters ( per capita ) of beer consumption
     - ข้อมูลเป็นประเภท integer
8. Spirit_PerCapita	
     - Consumption of spirits drink ( per capita )
     - ข้อมูลเป็นประเภท integer
9. Wine_PerCapita
     - Wine consumption
     - ข้อมูลเป็นประเภท integer

## Step4: Cleaning Dataset
#### 1.Check datatype ของ column ที่เป็นตัวเลขว่ามี datatype เป็น numeric จริงไหม
```
# check data type
is.numeric(happiness$HappinessScore)
is.numeric(happiness$HDI)
is.numeric(happiness$GDP_PerCapita)
is.numeric(happiness$Beer_PerCapita)
is.numeric(happiness$Spirit_PerCapita)
```
output ::
เป็น TRUE หมดเเสดงว่าเป็น numeric ทุก column
```
> # check data type
> is.numeric(happiness$HappinessScore)
[1] TRUE
> is.numeric(happiness$HDI)
[1] TRUE
> is.numeric(happiness$GDP_PerCapita)
[1] TRUE
> is.numeric(happiness$Beer_PerCapita)
[1] TRUE
> is.numeric(happiness$Spirit_PerCapita)
[1] TRUE
```
#### 2.Check column "Country" ว่ามีชื่อประเทศที่ซ้ำกันไหม เพื่อไม่ให้มีเเถวข้อมูลของประเทศซ้ำกัน
```
# check duplicate
duplicated(happiness$Country)
```
output ::
เป็น FLASE หมดเเสดงว่าไม่มีเเถวที่ประเทศซ้ำกัน
```
> duplicated(happiness$Country)
  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [24] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [47] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [93] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```
#### 3.Check range ของ "HappinessScore" ว่าอยู่ระหว่าง 0-10 รึป่าว
```
# check range of happiness score
assert_all_are_in_closed_range(happiness$HappinessScore, lower = 0, upper = 10)
```
ซึ่ง output ที่ได้นั้นไม่เเสดง error อะไรออกมาเเสดงว่าทุกเเถวของ column "HappinessScore" อยู่ในช่วง 0-10
#### 4.เปลี่ยนคำผิดด้วย stringr
```
# change noth to north
happiness$Hemisphere <- replace(happiness$Hemisphere, happiness$Hemisphere == "noth", "north")
```


## Step5: Exploratory Data Analysis
#### 1. หาค่าเฉลี่ยของ Happiness Score ของการดื่มแอลกอฮอล์ (เบียร์ เหล้า ไวน์) ในเเต่ละซีกโลก

code:
```
happiness %>% group_by(Hemisphere) %>% select(HappinessScore) %>% summarise(avg = mean(HappinessScore))
```
result:
 - ค่าเฉลี่ย Happiness Score ในซีกโลกเหนือ (north) = 5.63
 - ค่าเฉลี่ย Happiness Score ในซีกโลกใต้ (south) = 4.97
 - ค่าเฉลี่ย Happiness Score ของประเทศที่อยู่ในทั้งสองซีกโลก (both) = 5.90
```
  Hemisphere   avg
  <chr>      <dbl>
1 both        5.90
2 north       5.63
3 south       4.97
```
#### 2. หาว่าประเทศไหนมีการกินแอลกอฮอล์ในแต่ละประเภทมากที่สุด

code:
```

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

```
result:
 - ประเทศที่กินแอลกอฮอล์ประเภท beer มากที่สุดคือ "Namibia"
 - ประเทศที่กินแอลกอฮอล์ประเภท spirit มากที่สุดคือ "Belarus"
 - ประเทศที่กินแอลกอฮอล์ประเภท wine มากที่สุดคือ "France"
```
> # max of beer
> happiness %>% dplyr::select(Beer_PerCapita, Country) %>% filter(Beer_PerCapita == max_beer)
  Beer_PerCapita Country
1            376 Namibia
> # max of spirit
> happiness %>% dplyr::select(Spirit_PerCapita, Country) %>% filter(Spirit_PerCapita == max_spirit)
  Spirit_PerCapita Country
1              373 Belarus
> # max of wine
> happiness %>% dplyr::select(Wine_PerCapita, Country) %>% filter(Wine_PerCapita == max_wine) 
  Wine_PerCapita Country
1            370  France

```
#### 3. หาค่าเฉลี่ย Happiness score ในเเต่ละ region เเล้วนํามาเทียบกัน

code:
```
happiness %>% group_by(Region) %>% summarise(avg = mean(HappinessScore))
```
result:
```
Region                            avg
  <chr>                           <dbl>
1 Australia and New Zealand        7.32
2 Central and Eastern Europe       5.38
3 Eastern Asia                     5.48
4 Latin America and Caribbean      6.06
5 Middle East and Northern Africa  5.44
6 North America                    7.25
7 Southeastern Asia                5.49
8 Sub-Saharan Africa               4.15
9 Western Europe                   6.73
```
#### 4. หาค่าเฉลี่ยการกินเเอลกอฮอล์เเต่ละประเภทในเเต่ละภูมิภาค 

code:
```
happiness %>% group_by(Region) %>% summarise(avg_beer = mean(Beer_PerCapita),avg_spirit = mean(Spirit_PerCapita),avg_wine = mean(Wine_PerCapita))
```
result:
```
# A tibble: 9 x 4
  Region                          avg_beer avg_spirit avg_wine
  <chr>                              <dbl>      <dbl>    <dbl>
1 Australia and New Zealand          232         75.5    194. 
2 Central and Eastern Europe         170.       172.      83.8
3 Eastern Asia                        93.2      150.      10.2
4 Latin America and Caribbean        159.       110.      35.8
5 Middle East and Northern Africa     24.8       41.4     10.4
6 North America                      244.       140       92  
7 Southeastern Asia                   79.6      105.       3  
8 Sub-Saharan Africa                  78.5       20.8     12.2
9 Western Europe                     216.       102.     198. 
```

#### 5. หาค่าเฉลี่ยดัชนีผลิตภัณฑ์มวลรวมภายใน (GDP) ของเเต่ละภูมิภาค เเละนำมาเปรียบเทียบหาภูมิภาคที่มี GDP เฉลี่ยสูงสุดเเละต่ำสุด
code:
```
happiness %>% group_by(Region) %>% select(GDP_PerCapita) %>% summarise(avg = mean(GDP_PerCapita)) %>% arrange(desc(avg))
```
result:
 - GDP เฉลี่ยสูงสุดเท่ากับ 306.0 (Sub-Saharan Africa)
 - GDP เฉลี่ยสูงสุดเท่ากับ 8.55 (Central and Eastern Europe )
```
> mean_gdp_each_regoin %>% summarise(max = max(avg), min = min(avg))
# A tibble: 1 x 2
  Region                             avg
  <chr>                            <dbl>
1 Sub-Saharan Africa              306.  
2 North America                    50.0 
3 Western Europe                   46.0 
4 Australia and New Zealand        45.1 
5 Latin America and Caribbean      39.7 
6 Eastern Asia                     19.5 
7 Middle East and Northern Africa  17.5 
8 Southeastern Asia                13.5 
9 Central and Eastern Europe        8.55

```
