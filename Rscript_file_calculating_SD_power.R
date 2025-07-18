# This script calculates the power in a fixed sample size to detect a hazard ratio

# The cohort study plans to investigate whether being from a minority ethnic group is associated
# with an increased risk of adverse health outcomes in people w eczema compared to those without eczema

# I have selected eating disorders as probably the rarest outcome of interest under study, with estimated 
# prevalence of 0.6%, for this calculation

# I will compare power to detect this outcome between white, and each minority ethnic group respectively
# i.e. white vs Asian, white vs black, white vs mixed, and white vs other
# the minority ethnic group being 'exposed' and white being 'unexposed'

#--------------------------------------------------------------------------------------------------

# in stata using stpower cox (as there is no direct equivalent in R)
# n is the population sample size
# power can be set to 0.8 (80%) and two sided alpha (significance level) to 0.05
# hrfailp is the probability of getting outcome (example for eating disorders 0.006 or 0.6%) 

# input this into stata: stpower cox, n() power(.8) alpha(0.05) hr failp() sd()

#--------------------------------------------------------------------------------------------------

# first calculate the SD

#  sd = dependent on the number of “unexposed” patients for each exposed patient.  It’s calculated as:
# 
# *SD= sqroot [(1/n)*(n-1/n)]
# 
# *where n is unexposed plus exposed
# 
# sqrt(1/2 * 1/2) = 0.5 for a 1:1 ratio
# sqrt(1/3 * 2/3) = 0.47 (or 0.5) for a 2:1 ratio
# sqrt (1/4 * 3/4) = 0.43 for a 3:1 ratio
# sqrt (1/5 * 4/5) = 0.4 for a 4:1 ratio
# sqrt(1/11 * 10/11) = 0.29 (or 0.3) for a 10:1 ratio
# sqrt (1/19 * 18/19) = 0.22 (or 0.2) for a 19:1 ratio
# sqrt (1/25 * 24/25) = 0.196 (or 0.2) for a 24:1 ratio

# proving that the formula works for a 1:1 ratio
n <- 2
result <- sqrt((1/n) * (n-1)/n)
print(result)
# result is 0.5, as expected


# I have 80.3% white, 10.8% Asian, 5.4% black, 2.4% mixed, and 1.1% other in my population

# white plus Asian (80.3% and 10.8%) = 91.1

n <- 91.1
result <- sqrt((1/n) * (n-1)/n)
print(result)
#result is 0.1041943

# white plus black (80.3% and 5.4%) = 85.7

n <- 85.7
result <- sqrt((1/n) * (n-1)/n)
print(result)
# result is 0.1073893

# white plus mixed (80.3% and 2.4%) = 82.7

n <- 82.7
result <- sqrt((1/n) * (n-1)/n)
print(result)
# result is 0.1092963

# white plus other (80.3% and 1.1%) = 81.4
n <- 81.4
result <- sqrt((1/n) * (n-1)/n)
print(result)
# result is 0.1101548

# so for white vs each minority group, the standard deviation (SD) is similar, at 0.1

#--------------------------------------------------------------------------------------------------

# to calculate n, 3513875 individuals meet our definition of eczema and are eligible for matching
# but 80.4% have available ethnicity information, so I estimate that:

# 2825156 people with eczema have available ethnicity information
# # 2268600 of these are white (80.3%)
# # 305117 are Asian (10.8%)
# # 152558 are black (5.4%)
# # 67804 are mixed (2.4%)
# # 31077 are other (1.1%)

n <- 2825156
 n* 0.803
# 2268600
n*0.108
# 305116.8
n*0.054
# 152558.4
n*0.024
# 67803.74
n*0.011

#---------------------------------------------------------------------------------------------

# now I use stpowercox to calculate the HR detectable for eating disorder prevalence in white vs 
# each minority group individually

# WHITE VS ASIAN

# n = 
2268600+305117
# n= 2573717


# stpower cox, n(2573717) power(.8) alpha(0.05) hr failp(0.006) sd(0.1)
# 
# Estimated hazard ratio for Cox PH regression
# Wald test, hazard metric
# H0: [b1, b2, ..., bp] = [0, b2, ..., bp]
# 
# Input parameters:
#   
#   alpha =    0.0500  (two sided)
# sd =    0.1000
# N =   2573717
# power =    0.8000
# Pr(event) =    0.0060
# 
# Estimated number of events and hazard ratio:
#   
#   E =     15443
# hratio =    0.7982

# WHITE VS BLACK

# n = 
2268600+152558
# n= 2421158


# stpower cox, n(2421158) power(.8) alpha(0.05) hr failp(0.006) sd(0.1)
# 
# Estimated hazard ratio for Cox PH regression
# Wald test, hazard metric
# H0: [b1, b2, ..., bp] = [0, b2, ..., bp]
# 
# Input parameters:
#   
#   alpha =    0.0500  (two sided)
# sd =    0.1000
# N =   2421158
# power =    0.8000
# Pr(event) =    0.0060
# 
# Estimated number of events and hazard ratio:
#   
#   E =     14527
# hratio =    0.7926


# WHITE VS MIXED


# n = 
2268600+67804
# n= 2336404


# . stpower cox, n(2336404) power(.8) alpha(0.05) hr failp(0.006) sd(0.1)
# 
# Estimated hazard ratio for Cox PH regression
# Wald test, hazard metric
# H0: [b1, b2, ..., bp] = [0, b2, ..., bp]
# 
# Input parameters:
#   
#   alpha =    0.0500  (two sided)
# sd =    0.1000
# N =   2336404
# power =    0.8000
# Pr(event) =    0.0060
# 
# Estimated number of events and hazard ratio:
#   
#   E =     14019
# hratio =    0.7893

# WHITE VS OTHER


# stpowercox to calculate HR detectable for eating disorder prevalence in white vs other
# n = 
2268600+31077
# n= 2299677


# . stpower cox, n(2299677) power(.8) alpha(0.05) hr failp(0.006) sd(0.1)
# 
# Estimated hazard ratio for Cox PH regression
# Wald test, hazard metric
# H0: [b1, b2, ..., bp] = [0, b2, ..., bp]
# 
# Input parameters:
#   
#   alpha =    0.0500  (two sided)
# sd =    0.1000
# N =   2299677
# power =    0.8000
# Pr(event) =    0.0060
# 
# Estimated number of events and hazard ratio:
#   
#   E =     13799
# hratio =    0.7878

#--------------------------------------------------------------------------------------------------

# RESULTS

# The study would therefore have 80% power to detect a hazard ratio of 0.8 for the risk of 
# developing an eating disorder in someone from an ethnic minority with eczema, compared to someone
# who is white and has eczema, with a two-sided significance-level of 0.05.
