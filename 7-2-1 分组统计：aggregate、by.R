vars <- c("mpg", "hp", "wt")
# Listing 7.6 - Descriptive statistics by group with aggregate()

aggregate(mtcars[vars], by = list(am = mtcars$am), mean)
aggregate(mtcars[vars], by = list(am = mtcars$am), sd)

# Listing 7.7 - Descriptive statistics by group via by()
dstats <- function(x)(c(mean=mean(as.matrix(x)), sd=sd(as.matrix(x))))
by(mtcars[vars], mtcars$am, dstats)