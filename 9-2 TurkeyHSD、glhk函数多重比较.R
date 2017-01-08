opar <- par(no.readonly = TRUE)
# Listing 9.2 - Tukey HSD pairwise group comparisons
TukeyHSD(fit)
#，1time和2times的均值差异不显著（p=0.138），而1time和4times间的差异非常显著p<0.001
par(las=2)
par(mar=c(5,8,4,2)) 
plot(TukeyHSD(fit))
#成对比较图形如图9-2所示。第一个par语句用来旋转轴标签，第二个用来增大左边界的面积，
#可使标签摆放更美观（par选项参见第3章）。图形中置信区间包含0的疗法说明差异不显著
#（p>0.5）。
par(opar)

# Multiple comparisons the multcomp package
library(multcomp)
par(oma=c(2,2,2,2))
#oma:增加图片边框外距离（使我们可以在上方标注文字）
tuk <- glht(fit, linfct=mcp(trt="Tukey"))
#glht()函数提供了多重均值比较更为全面的方法，既适用于线性模型（如本章各例），也适用
#于广义线性模型（见第13章）。下面的代码重现了Tukey HSD检验，并用一个不同的图形对结果
#进行展示:
plot(cld(tuk, level=.05),col="lightgrey")
#表有相同字母表示差距不独立/差距不显著（1time-2time,2time-4time,4time-drugD）。
#没有标出相同字母表示差距显著。（例如DrugD-DrugE）
par(opar)

# 评估检验的假设条件
# 先查 离群点，如果有需要处理或删除
library(car)
outlierTest(fit)
#这里没有离群点

library(car)
qqPlot(lm(response ~ trt, data=cholesterol), 
       simulate=TRUE, main="Q-Q Plot", labels=FALSE)
#所有点落在拟合直线的95%置信区间（两条曲线）内，拟合成立。

# Assessing homogeneity of variances
bartlett.test(response ~ trt, data=cholesterol)
#P value0.9653拟合成立

