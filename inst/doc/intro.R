## ---- echo=FALSE, message=FALSE------------------------------------------
library(inferr)
library(dplyr)

## ----ttest---------------------------------------------------------------
ttest(hsb$write, mu = 50, type = 'all')

## ----pair1---------------------------------------------------------------
# Lower Tail Test
paired_ttest(hsb$read, hsb$write, alternative = 'less')

# Test all alternatives
paired_ttest(hsb$read, hsb$write, alternative = 'all')

## ----ind-----------------------------------------------------------------
hsb2 <- inferr::hsb
hsb2$female <- as.factor(hsb2$female)
ind_ttest(hsb2, 'female', 'write', alternative = 'all')

## ----os_prop1------------------------------------------------------------
# Using Variables
prop_test(as.factor(hsb$female), prob = 0.5)

## ----os_prop2------------------------------------------------------------
# Calculator
prop_test(200, prob = 0.5, phat = 0.3)

## ----ts_prop1------------------------------------------------------------
# Using Variables
ts_prop_test(var1 = treatment$treatment1, var2 = treatment$treatment2, alternative = 'all')

## ----ts_prop2------------------------------------------------------------
# Using Grouping Variable
ts_prop_grp(var = treatment2$outcome, group = treatment2$female, alternative = 'all')

## ----ts_prop3------------------------------------------------------------
# Calculator
ts_prop_calc(n1 = 30, n2 = 25, p1 = 0.3, p2 = 0.5, alternative = 'all')

## ----os_var--------------------------------------------------------------
# Lower Tail Test
os_vartest(mtcars$mpg, 0.3, alternative = 'less')

# Test all alternatives
os_vartest(mtcars$mpg, 0.3, alternative = 'all')

## ----ts_var1-------------------------------------------------------------
# Using Grouping Variable
var_test(mtcars$mpg, group_var = mtcars$am, alternative = 'all')

## ----ts_var2-------------------------------------------------------------
# Using Variables
var_test(hsb$read, hsb$write, alternative = 'all')

## ----binom_calc----------------------------------------------------------
# Using variables
binom_test(as.factor(hsb$female), prob = 0.5)

## ----binom_calc2---------------------------------------------------------
# calculator
binom_calc(32, 16, prob = 0.5)

## ----anova---------------------------------------------------------------
owanova(hsb, 'write', 'prog')

## ----gof1----------------------------------------------------------------
# basic example
race <- as.factor(hsb$race)
chisq_gof(race, c(20, 20, 20 , 140))

## ----gof2----------------------------------------------------------------
# using continuity correction
race <- as.factor(hsb$race)
chisq_gof(race, c(20, 20, 20 , 140), correct = TRUE)

## ----chi1----------------------------------------------------------------
chisq_test(as.factor(hsb$female), as.factor(hsb$schtyp))

## ----chi2----------------------------------------------------------------
chisq_test(as.factor(hsb$schtyp), as.factor(hsb$ses))

## ----lev1----------------------------------------------------------------
# Using Grouping Variable
levene_test(hsb$read, group_var = hsb$race)

## ----lev2----------------------------------------------------------------
# Using Variables
levene_test(hsb$read, hsb$write, hsb$socst)

## ----lev3----------------------------------------------------------------
# Using Linear Regression Model
m <- lm(read ~ female, data = hsb)
levene_test(m)

## ----lev4----------------------------------------------------------------
# Using Formula
levene_test(as.formula(paste0('read ~ schtyp')), hsb)

## ----cochran-------------------------------------------------------------
cochran_test(exam)

## ----mc1-----------------------------------------------------------------
himath <- ifelse(hsb$math > 60, 1, 0)
hiread <- ifelse(hsb$read > 60, 1, 0)
mcnemar_test(table(himath, hiread))

## ----mc2-----------------------------------------------------------------
mcnemar_test(matrix(c(135, 18, 21, 26), nrow = 2))

## ----runs1---------------------------------------------------------------
# linear regression
reg <- lm(mpg ~ disp, data = mtcars)

# basic example
runs_test(residuals(reg))

# drop values equal to threshold
runs_test(residuals(reg), drop = TRUE)

# recode data in binary format
runs_test(residuals(reg), split = TRUE)

# use mean as threshold
runs_test(residuals(reg), mean = TRUE)

# threshold to be used for counting runs
runs_test(residuals(reg), threshold = 0)

