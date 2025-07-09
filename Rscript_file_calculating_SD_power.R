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



# I have 80.3% white, 10.8% Asian, 5.4% black, 2.4% mixed, and 1.1% other in my population

# white and Asian (80.3% and 10.8%) = 91.1

n <- 91.1
result <- sqrt((1/n) * (n-1)/n)
print(result)
#result is 0.1041943

# in stata using stpower cox (as there is no direct equivalent in R)
# calculate power based on fixed sample size
# n is the population sample size
# power can be set to 0.8 (80%) or 0.9 (90%) and two sided alpha (significance level) to 0.05
# hrfailp is the probability of getting outcome (example is 0.094 or 9.4%) 

# stpower cox, n() power(.8) alpha(0.05) hr failp() sd()

# 3,513,875 individuals meet our definition of eczema, who were eligible for matching

# stpower cox, n() power(.8) alpha(0.05) hr failp(0.0) sd(0.1)
