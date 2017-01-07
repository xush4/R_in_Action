source("E:/Dropbox/Data Science/R_in_Action/8-9 R方交叉验证函数shrinkage.txt")
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                       "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Income + Illiteracy + Frost, data=states)
shrinkage(fit)
#shrinkage每次使用输出数值可能不同（随机抽样）
#基于初始样本的R平方（0.567）过于乐观了。对新数据更好的方差解释率估计是0.44
#通过选择有更好泛化能力的模型，还可以用交叉验证来挑选变量。例如，含两个预测变量
#（Population和Illiteracy）的模型，比全变量模型R平方减少得更少（0.04 vs. 0.12）
fit2 <- lm(Murder~Population+Illiteracy,data=states)
shrinkage(fit2)