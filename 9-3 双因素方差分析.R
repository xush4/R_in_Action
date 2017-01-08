attach(ToothGrowth)
table(supp,dose)
aggregate(len, by=list(supp,dose), FUN=mean)
aggregate(len, by=list(supp,dose), FUN=sd)
dose <- factor(dose)
fit <- aov(len ~ supp*dose)
summary(fit)
#使用summary，差异显著
# plotting interactions
interaction.plot(dose, supp, len, type="b", 
                 col=c("red","blue"), pch=c(16, 18),
                 main = "Interaction between Dose and Supplement Type")
library(gplots)
plotmeans(len ~ interaction(supp, dose, sep=" "),
          connect=list(c(1, 3, 5),c(2, 4, 6)), 
          col=c("red","darkgreen"),
          main = "Interaction Plot with 95% CIs", 
          xlab="Treatment and Dose Combination")
library(HH)
interaction2wt(len~supp*dose)
#以上三幅图形都表明随着橙汁和维生素C中的抗坏血酸剂量的增加，牙齿长度变长。对于
#0.5mg和1mg剂量，橙汁比维生素C更能促进牙齿生长；对于2mg剂量的抗坏血酸，两种喂食方法
#下牙齿长度增长基本相同。