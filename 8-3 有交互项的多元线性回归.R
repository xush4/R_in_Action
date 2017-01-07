fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit)
#马力与车重的交互项是显著的，这意味着什么呢？若两个预测变量的交互项显著，说明响应变
#量与其中一个预测变量的关系依赖于另外一个预测变量的水平。因此此例说明，每加仑汽油行
#驶英里数与汽车马力的关系依车重不同而不同。
#通过effects包中的effect()函数，你可以用图形展示交互项的结果。格式为：
#plot(effect(term, mod,, xlevels), multiline=TRUE)
#term即模型要画的项，mod为通过lm()拟合的模型，xlevels是一个列表，指定变量要设定
#的常量值，multiline=TRUE选项表示添加相应直线。对于上例，即：
library(effects)
plot(effect("hp:wt", fit,, list(wt=c(2.2,3.2,4.2))), multiline=TRUE)
