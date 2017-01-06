opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2))
#最简单直接：
hist(mtcars$mpg)
#制定数组和颜色
hist(mtcars$mpg,breaks=12,col="red",xlab="mpg",main="Colored with 12 bins")
#添加轴须图
hist(mtcars$mpg, freq = FALSE, breaks = 12, col = "red", 
     xlab = "Miles Per Gallon", 
     main = "Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))#核密图
lines(density(mtcars$mpg), col = "blue", lwd = 2)#轴须图

#正态密度曲线和边框
x <- mtcars$mpg
h <- hist(x, breaks = 12, col = "red", 
          xlab = "Miles Per Gallon", 
          main = "Histogram with normal curve and box")
xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)
box()
par(opar)

#比较核密图：
par(lwd = 2)
library(sm)
attach(mtcars)
#创建分组因子
cyl.f <- factor(cyl, levels = c(4, 6, 8), 
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))

sm.density.compare(mpg, cyl, xlab = "Miles Per Gallon")
title(main = "MPG Distribution by Car Cylinders")

colfill <- c(2:(2 + length(levels(cyl.f))))
cat("Use mouse to place legend...", "\n\n")#用鼠标添加图例
legend(locator(1), levels(cyl.f), fill = colfill)
detach(mtcars)
par(lwd = 1)