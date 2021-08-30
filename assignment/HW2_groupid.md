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
4.) Number of people using their left hand to write by gender.
```{R}
table(survey$Sex[survey$W.Hnd == 'Left'])
# Female   Male 
     7     10 
```


### Team: วชสต.
1. นายพิชญะ ไพรินทร์ StudentID: 63130500086
2. นายสิรภพพ์ ใช้เทียมวงษ์ StudentID: 63130500117
3. นางสาวอริสา อุดมขจรกิตติ StudentID: 63130500134
4. นางสาวชนัญญา สินพิชิต StudentID: 63130500140
5. นางสาวพัทธ์ธีรา จงวัฒนานุกูล StudentID: 63130500143
