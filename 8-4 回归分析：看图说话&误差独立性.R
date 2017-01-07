#R基础安装中提供了大量检验回归分析中统计假设的方法。最常见的方法就是对lm()函数
#返回的对象使用plot()函数，可以生成评价模型拟合情况的四幅图形。
opar <- par(no.readonly = TRUE)
fit <- lm(weight ~ height, data=women)
par(mfrow=c(2,2))
plot(fit)


states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
par(mfrow=c(2,2))
plot(fit)
#除去Nevada一个离群点，模型假设得到了很好的满足。
par(opar)
library(car)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
qqPlot(fit, labels=row.names(states), id.method="identify",
       simulate=TRUE, main="Q-Q Plot")
#id.method = "identify"选项能够交互式绘图——待图形绘制后，用鼠标单击图形内的点，
#将会标注函数中labels选项的设定值。
states["Nevada",];fitted(fit)["Nevada"]
#Nevada的谋杀率是11.5%，而模型预测的谋杀率为3.9%。

#绘制学生化残差图的函数
residplot <- function(fit, nbreaks=10) {
  z <- rstudent(fit)
  hist(z, breaks=nbreaks, freq=FALSE,
       xlab="Studentized Residual",
       main="Distribution of Errors")
  rug(jitter(z), col="brown")
  curve(dnorm(x, mean=mean(z), sd=sd(z)),
        add=TRUE, col="blue", lwd=2)
  lines(density(z)$x, density(z)$y,
        col="red", lwd=2, lty=2)
  legend("topright",
         legend = c( "Normal Curve", "Kernel Density Curve"),
         lty=1:2, col=c("blue","red"), cex=.7)
}
residplot(fit)

durbinWatsonTest(fit)
#p值不显著（p=0.282）说明无自相关性，误差项之间独立。滞后项（lag=1）表明数据集中每个
#数据都是与其后一个数据进行比较的。该检验适用于时间独立的数据，对于非聚集型的数据并
#不适用。

#成分残差图:
library(car)
crPlots(fit)
#图形存在非线性，则说明你可能对预测变量的函数形式建模不够充分，那么就需要添加一些曲
#线成分，比如多项式项，或对一个或多个变量进行变换（如用log(X)代替X），或用其他回归
#变体形式而不是线性回归。

#同方差性
library(car)
ncvTest(fit)
#可以看到，计分检验不显著（p=0.19），说明满足方差不变假设。你还可以通过分布水平图
#看到这一点，其中的点在水平的最佳拟合曲线周围呈水平随机分布。若违反了该假设，你将
#会看到一个非水平的曲线。
spreadLevelPlot(fit)
#代码结果建议幂次变换（suggested power transformation）的含义是，经过p次幂（Yp）变
#换，非恒定的误差方差将会平稳。

#线性模型假设的综合验证
library(gvlma)
gvmodel <- gvlma(fit)
summary(gvmodel)
#数据满足OLS回归模型所有的统计假设（p=0.597）,(P>0.05)意味着假设成立，拟合成功