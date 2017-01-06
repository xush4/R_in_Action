# save original graphic settings
opar <- par(no.readonly = TRUE)
vars <- c("mpg", "hp", "wt")
head(mtcars[vars])

# Listing 7.1 - descriptive stats via summary

summary(mtcars[vars])

# Listing 7.2 - descriptive stats via sapply()
#
mystats <- function(x, na.omit = FALSE) {
  if (na.omit) 
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x - m)^3/s^3)/n
  kurt <- sum((x - m)^4/s^4)/n - 3
  return(c(n = n, mean = m, stdev = s, skew = skew, kurtosis = kurt))
}
sapply(mtcars[vars], mystats)
#sapply 可以插入的经典函数有：mean、sd、var、min、max、median、length、range
#和quantile。其他函数需要自己写出：例如上方的mystats。

#对于mystats结果的解释：对于样本中的32种车型，每加仑汽油行驶英里数的平均值为20.1，标准差为6.0。分布呈现右偏（偏
#度+0.61），并且较正态分布稍平（峰度???0.37）。
