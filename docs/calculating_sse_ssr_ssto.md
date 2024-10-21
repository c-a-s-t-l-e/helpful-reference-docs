### How to Calculate the SSE (Sum of Squares Error), SSR (Sum of Squares Regression), and SSTO (Total Sum of Squares) From a Summary of a Simple Linear Regression Model.

Our example:

```
Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 17.399650   8.622660   2.018   0.0518 .  
X            0.106770   0.008277  12.900 1.93e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 23.74 on 33 degrees of freedom
Multiple R-squared:  0.8345,	Adjusted R-squared:  0.8295 
F-statistic: 166.4 on 1 and 33 DF,  p-value: 1.931e-14
```

#### 1. Find the SSE

To find the SSE, get the number for the degrees of freedom and the residual standard error

SSE = degrees_of_freedom * (residual_standard_error)^2 

---

Example:

``` 
SSE = 33 * (23.74)^2
SSE = 18598.39
```

---

#### 2. Find the SSTO

To find the SSTO, use the number you got from the SSE and the R^2 value with the following formula

SSTO = SSE / (1 - R^2)

---

Example:

```
SSTO = 18598.39 / (1 - .8345) # Note to use the "Multiple R-squared" value
SSTO = 112377
```

---

#### 3. Find the SSR

Now since we have the SSTO and SSE, the SSR will then be 

SSR = SSTO - SSE

---

Example:

```
SSR = 112377 - 18598.39
SSR = 93778.61
```

---

#### Review:

```
SSTO = 112377
SSR = 93778.61
SSE = 18598.39
```
