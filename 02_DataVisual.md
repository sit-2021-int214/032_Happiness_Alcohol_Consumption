
## Analytical Inferential Statistics
ในการเก็บข้อมูล ในปี2016 จากทั้งหมด 122 ประเทศ เเบ่งเป็นประเทศในซีกโลกเหนือจํานวน 96 ประเทศ ซีกโลกใต้ 21 ประเทศ เเละประเทศที่อยู่ในซีกโลกเหนือเเละใต้ 5 ประเทศ
เราจึงมีความสนใจว่า happiness scoreเฉลี่ยของประเทศฝั่งซีกโลกเหนือมีค่ามากกว่าประเทศที่อยู่ในซีกโลกใต้  ที่ระดับความเชื่อมั่น 95%


### Step 0: Assign variables

```
n1 <- 96
n2 <- 21
var1 <- 1.22 
var2 <- 1.46
xbar1 <- 5.63
xbar2 <- 4.97
D0 <- 0
```

### Step 1: State the hypothesis

```
#h0: mue1 - mue <= 0 and ha: mue1 - mue > 0
```

### Step 2: Level of significance

```
alpha <- 0.05
```

### Step 3: Test statistic

```
z <- ((xbar1-xbar2)- D0) / sqrt((var1/n1)+(var2/n2)) ; z
```

### Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- 1-pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(1-alpha);zalpha
```

### Step 5: Compare

```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z>=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```

### Step 6: Conclusion

reject H0
