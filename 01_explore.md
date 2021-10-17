# Happiness Alcohol Consumption
Datasets from: https://www.kaggle.com/marcospessotto/happiness-and-alcohol-consumption

### Steps
1. Define a question
2. Download Library and dataset
3. Explore the dataset from the original dataset
4. Cleaning Dataset
5. Exploratory Data Analysis

## Step1: Define a question

1. อยากรู้ค่าเฉลี่ยของ Happy Score ของการดื่มแอลกอฮอล์ (เบียร์ เหล้า ไวน์) ของประเทศในเเต่ละซีกโลก
2. อยากรู้ว่าประเทศไหนมีการกินแอลกอฮอล์ในแต่ละประเภทมากที่สุด
3. อยากรู้ค่าเฉลี่ย Happiness score ในเเต่ละ region เเล้วนํามาเทียบกัน
4. อยากรู้ว่าค่า GDP และ HDI มีผลต่อการดื่มเเอลกอฮอล์มากน้อยเพียงใดในเเต่ละประเทศ


## Step2: Download Library and dataset
```
# Library
install.packages("readr")
install.packages("assertive")
install.packages("stringr")
library(readr)    
library(stringr)   
library(assertive)  
# Dataset
happiness <- read.csv("/Users/ASUS/Downloads/HappinessAlcoholConsumption.csv")
View(happiness)
```
## Step3: Explore the dataset from the original dataset
ใน dataset นี้ประกอบด้วยข้อมูลทั้งหมด 9 คอลัมน์คือ 
1. Country 
     - ประกอบด้วยรายชื่อประเทศทั้งหมด 122 ประเทศที่เเตกต่างกัน
     - ข้อมูลเป็นประเภท character
2. Region	
     - ข้อมูลเป็นประเภท character
3. Hemisphere 
     - เเบ่งออกเป็นสามอย่างคือ north south เเละ both
     - ข้อมูลเป็นประเภท character
4. HappinessScore 
     - เกณฑ์วัดระดับความสุข ตั้งเเต่ 0-10
     - ข้อมูลเป็นประเภท double
5. HDI	
     - ข้อมูลเป็นประเภท integer
6. GDP_PerCapita	
     - ข้อมูลเป็นประเภท double
7. Beer_PerCapita	
     - ข้อมูลเป็นประเภท integer
8. Spirit_PerCapita	
     - ข้อมูลเป็นประเภท integer
9. Wine_PerCapita
     - ข้อมูลเป็นประเภท integer

## Step4: Cleaning Dataset
1.Check datatype ของ column ที่เป็นตัวเลขว่ามี datatype เป็น numeric จริงไหม
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

2.Check column "Country" ว่ามีชื่อประเทศที่ซ้ำกันไหม เพื่อไม่ให้มีเเถวข้อมูลของประเทศซ้ำกัน
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

3.Check range ของ "HappinessScore" ว่าอยู่ระหว่าง 0-10 รึป่าว
```

# check range of happiness score
assert_all_are_in_closed_range(happiness$HappinessScore, lower = 0, upper = 10)

```
ซึ่ง output ที่ได้นั้นไม่เเสดง error อะไรออกมาเเสดงว่าทุกเเถวของ column "HappinessScore" อยู่ในช่วง 0-10

## Step5: Exploratory Data Analysis
