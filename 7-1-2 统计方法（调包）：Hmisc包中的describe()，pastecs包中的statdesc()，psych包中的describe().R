# Listing 7.3 - Descriptive statistics (Hmisc package)

library(Hmisc)
describe(mtcars[vars])

# Listing 7.4 - Descriptive statistics (pastecs package)

library(pastecs)
stat.desc(mtcars[vars])
#个人认为这个函数sta.desc最好！
# Listing 7.5 - Descriptive statistics (psych package)

library(psych)
describe(mtcars[vars])