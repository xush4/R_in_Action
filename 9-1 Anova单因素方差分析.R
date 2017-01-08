#以multcomp包中的cholesterol数据集为例（取自Westfall、Tobia、Rom、Hochberg，1999），
#50个患者均接受降低胆固醇药物治疗（trt）五种疗法中的一种疗法。其中三种治疗条件使用药
#物相同，分别是20mg一天一次（1time）、10mg一天两次（2times）和5mg一天四次（4times）。
#剩下的两种方式（drugD和drugE）代表候选药物。哪种药物疗法降低胆固醇（响应变量）最多？
library(multcomp)
attach(cholesterol)
table(trt) 
aggregate(response, by=list(trt), FUN=mean) 
#均值显示drugE降低胆固醇最多，而1time降低胆固醇最少
aggregate(response, by=list(trt), FUN=sd) 
fit <- aov(response ~ trt)   
#ANOVA对治疗方式（trt）的F检验非常显著（p<0.0001），说明五种疗法的效果不同
summary(fit)
library(gplots)
plotmeans(response ~ trt, xlab="Treatment", ylab="Response", 
          main="Mean Plot\nwith 95% CI")
#点图（95%置信区间）
detach(cholesterol)
