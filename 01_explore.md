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

## Step3: Explore the dataset from the original dataset
ใน dataset นี้ประกอบด้วยข้อมูลทั้งหมด 9 คอลัมน์คือ 
1. Country 
     - ประกอบด้วยรายชื่อประเทศทั้งหมด 122 ประเทศที่เเตกต่างกัน
     - ข้อมูลเป็นประเภท character
2. Region	
     - 
3. Hemisphere 
     - เเบ่งออกเป็นสามอย่างคือ north south เเละ both
4. HappinessScore 
     - เกณฑ์วัดระดับความสุข ตั้งเเต่ 0-10
5. HDI	
     - 
6. GDP_PerCapita	
     -
7. Beer_PerCapita	
     -
8. Spirit_PerCapita	
     -
9. Wine_PerCapita
     -

## Step4: Cleaning Dataset
ทำการ check datatype ของ column ที่เป็นตัวเลขว่ามี datatype เป็น numeric จริงไหม
ซึ่ง output ที่ได้นั้นเป็น TRUE หมดเลย เเสดงว่าเป็น numeric ทุก column

```
# check data type
is.numeric(happiness$HappinessScore)
is.numeric(happiness$HDI)
is.numeric(happiness$GDP_PerCapita)
is.numeric(happiness$Beer_PerCapita)
is.numeric(happiness$Spirit_PerCapita)

```

```
# check duplicate
duplicated(happiness$Country)
```

## Step5: Exploratory Data Analysis
