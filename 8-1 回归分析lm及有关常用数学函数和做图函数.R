# ~ 分隔符号，左边为响应变量，右边为解释变量。例如，要通过x、z 和w 预测y，代码为y ~ x + z + w
# + 分隔预测变量
# : 表示预测变量的交互项。例如，要通过x、z 及x 与z 的交互项预测y，代码为y ~ x + z + x:z
# * 表示所有可能交互项的简洁方式。代码y~ x * z * w 可展开为y ~ x + z + w + x:z + x:w + z:w +
#   x:z:w
# ^ 表示交互项达到某个次数。代码y ~ (x + z + w)^2 可展开为y ~ x + z + w + x:z + x:w + z:w
# . 表示包含除因变量外的所有变量。例如，若一个数据框包含变量x、y、z 和w，代码y ~ .可展开为y ~
#  x + z + w
# - 减号，表示从等式中移除某个变量。例如，y ~ (x + z + w)^2 – x:w 可展开为y ~ x + z + w +
#  x:z + z:w
# -1 删除截距项。例如，表达式y ~ x - 1 拟合y 在x 上的回归，并强制直线通过原点
# I() 从算术的角度来解释括号中的元素。例如，y ~ x + (z + w)^2 将展开为y ~ x + z + w + z:w。
# 相反, 代码y ~ x + I((z + w)^2)将展开为y ~ x + h，h 是一个由z 和w 的平方和创建的新变量
# function 可以在表达式中用的数学函数。例如，log(y) ~ x + z + w 表示通过x、z 和w 来预测log(y)

# 单一数据回归
fit <- lm(weight ~ height, data=women)
summary(fit)
#weight=-87.52+3.45*height
#R-squared:  0.991 意味着这个式子可以解释99.1%的方差（如果按原数据分布的话）

#多项数据以及多项式回归
fit2 <- lm(weight ~ height + I(height^2), data=women)
summary(fit2)
plot(women$height,women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
lines(women$height,fitted(fit2))
#二次项提高了模型的拟合度。
#weight=261.88-7.35*height+0.083*(height^2)

#画图：car包中的scatterplot()函数
library(car)
scatterplot(weight ~ height, data=women,
            spread=FALSE, smoother.args=list(lty=2), pch=19,
            main="Women Age 30-39",
            xlab="Height (inches)",
            ylab="Weight (lbs.)")
#这个功能加强的图形，既提供了身高与体重的散点图、线性拟合曲线和平滑拟合（loess）曲
#线，还在相应边界展示了每个变量的箱线图。