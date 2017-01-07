states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
cor(states)
library(car)
scatterplotMatrix(states, spread=FALSE, smoother.args=list(lty=2),
                    main="Scatter Plot Matrix")
#scatterplotMatrix()函数默认在非对角线区域绘制变量间的散点图，并添加平滑和线性
#拟合曲线。对角线区域绘制每个变量的密度图和轴须图。

states <- as.data.frame(state.x77[,c("Murder", "Population",
                                       "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,
            data=states)
summary(fit)
#文盲率的回归系数为4.14，表示控制人口、收入和自然环境不变时，文盲率上升1%，谋杀率
#将会上升4.14%，它的系数在p<0.001的水平下显著不为0。相反，Frost的系数没有显著不为
#0（p=0.954），表明当控制其他变量不变时，Frost与Murder不呈线性相关。总体来看，所有
#的预测变量解释了各州谋杀率57%的方差。