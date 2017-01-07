# 离群点:模型预测效果不佳的观测点
library(car)
outlierTest(fit)

#高杠杆值点:与其他预测变量有关的离群点。
#换句话说，它们是由许多异常的预测变量值组合起来的，与响应变量值没有关系。
hat.plot <- function(fit) {
  p <- length(coefficients(fit))
  n <- length(fitted(fit))
  plot(hatvalues(fit), main="Index Plot of Hat Values")
  abline(h=c(2,3)*p/n, col="red", lty=2)
  identify(1:n, hatvalues(fit), names(hatvalues(fit)))
}
#点击相关数据点进行标注，按esc键停止标注并输出数值
hat.plot(fit)

#强影响点：即对模型参数估计值影响有些比例失衡的点。
cutoff <- 4/(nrow(states)-length(fit$coefficients)-2)
plot(fit, which=4, cook.levels=cutoff)
#通过图形可以判断Alaska、Hawaii和Nevada是强影响点。若删除这些点，将会导致回归模型
#截距项和斜率发生显著变化。

#利用car包中的influencePlot()函数，你还可以将离群点、杠杆值和强影响点的信息整合到一
#幅图形中：
library(car)
influencePlot(fit, id.method="identify", main="Influence Plot",
              sub="Circle size is proportional to Cook's distance")
#标注完成后按esc推出
#纵坐标超过+2或小于–2的州可被认为是离群点，水平轴超过0.2或0.3的州有高杠杆值（通常为
#预测值的组合）。圆圈大小与影响成比例，圆圈很大的点可能是对模型参数的估计造成的不成
#比例影响的强影响点