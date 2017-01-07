#逐步回归
library(MASS)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,
          data=states)
stepAIC(fit, direction="backward")
#开始时模型包含4个（全部）预测变量，然后每一步中，AIC列提供了删除一个行中变量后
#模型的AIC值，<none>中的AIC值表示没有变量被删除时模型的AIC。第一步，Frost被删除，AIC
#从97.75降低到95.75；第二步，Income被删除，AIC继续下降，成为93.76。然后再删除变量将会
#增加AIC，因此终止选择过程。

#全子集回归法（可以找到最优解，但计算量大）
library(leaps)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
leaps <-regsubsets(Murder ~ Population + Illiteracy + Income +
                     Frost, data=states, nbest=4)
plot(leaps, scale="adjr2")
#第一行中（图底部开始），可以看到含intercept（截距项）和Income的模型调整R平方为
#0.033，含intercept和Population的模型调整R平方为0.1。跳至第12行，你会看到含
#intercept、Population、Illiteracy和Income的模型调整R平方值为0.54，而仅含intercept、
#Population和Illiteracy的模型调整R平方为0.55。此处，你会发现含预测变量越少的模型调整
#R平方越大（对于非调整的R平方，这是不可能的）。图形表明，双预测变量模型
#（Population和Illiteracy）是最佳模型。
library(car)
subsets(leaps, statistic="cp",
        main="Cp Plot for All Subsets Regression")
#点击添加字母说明的位置
abline(1,1,lty=2,col="red")
#越好的模型离截距项和斜率均为1的直线越近。图形表明，你可以选择这几个模型，其余可能的
#模型都可以不予考虑：含Population和Illiteracy的双变量模型；含Population、Illiteracy
#和Frost的三变量模型，或Population、Illiteracy和Income的三变量模型（它们在图形上重叠
#了，不易分辨）；含Population、Illiteracy、Income和Frost的四变量模型。