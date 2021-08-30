# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) The average weight of female cat's heart is 9.202128
```{R}
mean(cats$Hwt[cats$Sex == 'F'])
#  9.202128
```

2.) The number of male students smoked heavy more than female students.
```{R}
table(survey$Sex[survey$Smoke == 'Heavy'])
# male = 6, female = 5
```
3.) Statistical number of female who exercise.
```{R}
summary(survey$Exer[survey$Sex == 'Female'])
# Freq None Some NA's 
  49   11   58    1 
```
4.) The number of people writing with their left hand was more male than female.
```{R}
table(survey$Sex[survey$W.Hnd == 'Left'])
# Female   Male 
     7     10 
```
5.) From the survey table, Find average height and age of each gender show in data-frame(ถ้าช่องไหนไม่มี record ไม่ต้องนํามาคํานวณ)
```{R}
gender <- c("Male", "Female")

AvgMaleAge <- c(survey$Age[survey$Sex == 'Male'])
AMA <- mean(AvgMaleAge, na.rm = TRUE)

AvgFemaleAge <- c(survey$Age[survey$Sex == 'Female'])
AFA <- mean(AvgFemaleAge, na.rm = TRUE)

AvgMaleHeight <- c(survey$Height[survey$Sex == 'Male'])
AMH <- mean(AvgMaleHeight, na.rm = TRUE)

AvgFemaleHeight <- c(survey$Height[survey$Sex == 'Female'])
AFH <- mean(AvgFemaleHeight, na.rm = TRUE)

AvgAge <- c(AMA,AFA)
AvgHeight <- c(AMH,AFH)

table <- data.frame(gender,AvgAge,AvgHeight)
View(table)
```

### Team: วชสต.
1. นายพิชญะ ไพรินทร์ StudentID: 63130500086
2. นายสิรภพพ์ ใช้เทียมวงษ์ StudentID: 63130500117
3. นางสาวอริสา อุดมขจรกิตติ StudentID: 63130500134
4. นางสาวชนัญญา สินพิชิต StudentID: 63130500140
5. นางสาวพัทธ์ธีรา จงวัฒนานุกูล StudentID: 63130500143
