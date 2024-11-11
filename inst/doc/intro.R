## ----echo=FALSE, message=FALSE------------------------------------------------
library(inferr)

## ----ttest--------------------------------------------------------------------
ifr_os_t_test(hsb, write, mu = 50, alternative = 'all')

## ----pair1--------------------------------------------------------------------
# Lower Tail Test
ifr_ts_paired_ttest(hsb, read, write, alternative = 'less')

# Test all alternatives
ifr_ts_paired_ttest(hsb, read, write, alternative = 'all')

## ----ind----------------------------------------------------------------------
ifr_ts_ind_ttest(hsb, female, write, alternative = 'all')

## ----os_prop1-----------------------------------------------------------------
# Using Variables
ifr_os_prop_test(hsb, female, prob = 0.5)

## ----os_prop2-----------------------------------------------------------------
# Calculator
ifr_os_prop_test(200, prob = 0.5, phat = 0.3)

## ----ts_prop1-----------------------------------------------------------------
# Using Variables
ifr_ts_prop_test(treatment, treatment1, treatment2, alternative = 'all')

## ----ts_prop2-----------------------------------------------------------------
# Using Grouping Variable
ifr_ts_prop_group(treatment2, outcome, female, alternative = 'all')

## ----ts_prop3-----------------------------------------------------------------
# Calculator
ifr_ts_prop_calc(n1 = 30, n2 = 25, p1 = 0.3, p2 = 0.5, alternative = 'all')

## ----os_var-------------------------------------------------------------------
# Lower Tail Test
ifr_os_var_test(mtcars, mpg, 0.3, alternative = 'less')

# Test all alternatives
ifr_os_var_test(mtcars, mpg, 0.3, alternative = 'all')

## ----ts_var1------------------------------------------------------------------
# Using Grouping Variable
ifr_ts_var_test(hsb, read, group_var = female, alternative = 'all')

## ----ts_var2------------------------------------------------------------------
# Using Variables
ifr_ts_var_test(hsb, read, write, alternative = 'all')

## ----binom_calc---------------------------------------------------------------
# Using variables
ifr_binom_test(hsb, female, prob = 0.5)

## ----binom_calc2--------------------------------------------------------------
# calculator
ifr_binom_calc(32, 16, prob = 0.5)

## ----anova--------------------------------------------------------------------
ifr_oneway_anova(hsb, write, prog)

## ----gof1---------------------------------------------------------------------
# basic example
ifr_chisq_gof_test(hsb, race, c(20, 20, 20 , 140))

## ----gof2---------------------------------------------------------------------
# using continuity correction
ifr_chisq_gof_test(hsb, race, c(20, 20, 20 , 140), correct = TRUE)

## ----chi1---------------------------------------------------------------------
ifr_chisq_assoc_test(hsb, female, schtyp)

## ----chi2---------------------------------------------------------------------
ifr_chisq_assoc_test(hsb, schtyp, ses)

## ----lev1---------------------------------------------------------------------
# Using Grouping Variable
ifr_levene_test(hsb, read, group_var = race)

## ----lev2---------------------------------------------------------------------
# Using Variables
ifr_levene_test(hsb, read, write, socst)

## ----cochran------------------------------------------------------------------
ifr_cochran_qtest(exam, exam1, exam2, exam3)

## ----mc3----------------------------------------------------------------------
hb <- hsb
hb$himath <- ifelse(hsb$math > 60, 1, 0)
hb$hiread <- ifelse(hsb$read > 60, 1, 0)
ifr_mcnemar_test(hb, himath, hiread)

## ----mc1----------------------------------------------------------------------
himath <- ifelse(hsb$math > 60, 1, 0)
hiread <- ifelse(hsb$read > 60, 1, 0)
ifr_mcnemar_test(table(himath, hiread))

## ----mc2----------------------------------------------------------------------
ifr_mcnemar_test(matrix(c(135, 18, 21, 26), nrow = 2))

## ----runs1--------------------------------------------------------------------
# basic example
ifr_runs_test(hsb, read)

# drop values equal to threshold
ifr_runs_test(hsb, read, drop = TRUE)

# recode data in binary format
ifr_runs_test(hsb, read, split = TRUE)

# use mean as threshold
ifr_runs_test(hsb, read, mean = TRUE)

# threshold to be used for counting runs
ifr_runs_test(hsb, read, threshold = 0)

