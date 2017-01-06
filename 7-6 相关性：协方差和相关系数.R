states <- state.x77[, 1:6]
cov(states)#方差与协方差
cor(states)#Pearson
cor(states, method="spearman")#Spearman，此处也可以设置为kendall
#首个语句计算了方差和协方差，第二个语句则计算了Pearson积差相关系数，而第三个语句计算
#了Spearman等级相关系数。举例来说，我们可以看到收入和高中毕业率之间存在很强的正相关，
#而文盲率和预期寿命之间存在很强的负相关。

x <- states[, c("Population", "Income", "Illiteracy", "HS Grad")]
y <- states[, c("Life Exp", "Murder")]
cor(x, y)
#在默认情况下得到的结果是一个方阵（所有变量之间两两计算相关）。你同样可以
#计算非方形的相关矩阵。观察以下示例：
