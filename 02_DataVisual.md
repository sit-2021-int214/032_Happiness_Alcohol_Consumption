## Data Visualization
yoyoooooooooooooooooooooooooooooooooooooo



## Analytical Inferential Statistics
ในการเก็บข้อมูล ในปี2016 จากทั้งหมด 122 ประเทศ เเบ่งเป็นประเทศในซีกโลกเหนือจํานวน 96 ประเทศ ซีกโลกใต้ 21 ประเทศ เเละประเทศที่อยู่ในซีกโลกเหนือเเละใต้ 5 ประเทศ
เราจึงมีความสนใจว่า happiness scoreเฉลี่ยของประเทศฝั่งซีกโลกเหนือมีค่ามากกว่าประเทศที่อยู่ในซีกโลกใต้  ที่ระดับความเชื่อมั่น 95%

```
eikfljowiesklf
```

Step 0: Assign variables

```
n <-
sd <-
xbar <-
u0 <-
```

Step 1: State the hypothesis

```
#h0:   ,ha:
```

Step 2: Level of significance

```
alpha <-
```

Step 3: Test statistic

```
z <- (xbar - u0) / (sd/sqrt(n));z
```

Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha
```

Step 5: Compare

```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```

Step 6: Conclusion

//Answer
