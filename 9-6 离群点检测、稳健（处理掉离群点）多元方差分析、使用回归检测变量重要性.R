#  Listing 9.9 - Assessing multivariate normality
center <- colMeans(y)
n <- nrow(y)
p <- ncol(y)
cov <- cov(y)
d <- mahalanobis(y,center,cov)
coord <- qqplot(qchisq(ppoints(n),df=p),
                d, main="QQ Plot Assessing Multivariate Normality",
                ylab="Mahalanobis D2")
abline(a=0,b=1)
identify(coord$x, coord$y, labels=row.names(UScereal))


# multivariate outliers
library(mvoutlier)
outliers <- aq.plot(y)
outliers

# 稳健（Robust）多元方差分析
library(rrcov)
Wilks.test(y,shelf, method="mcd")  # this can take a while
#从结果来看，稳健检验对离群点和违反MANOVA假设的情况不敏感，而且再一次验证了存
#储在货架顶部、中部和底部的谷物营养成分含量不同。p-value = 0.0002095

# 用回归来做ANOVA，不同类型转化为不同数值
fit.lm <- lm(response ~ trt, data=cholesterol)
summary(fit.lm)
contrasts(cholesterol$trt)