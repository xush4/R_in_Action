# Listing 7.8 Summary statists by group (doBy package)

library(doBy)
summaryBy(mpg + hp + wt ~ am, data = mtcars, FUN = mystats)

# Listing 7.9 - Summary statistics by group (psych package)

library(psych)
describe.by(mtcars[vars], mtcars$am)

# Listing 1.10 Summary statistics by group (reshape package)

library(reshape)
dstats <- function(x) (c(n = length(x), mean = mean(x), 
                         sd = sd(x)))
dfm <- melt(mtcars, measure.vars = c("mpg", "hp", 
                                     "wt"), id.vars = c("am", "cyl"))
cast(dfm, am + cyl + variable ~ ., dstats)