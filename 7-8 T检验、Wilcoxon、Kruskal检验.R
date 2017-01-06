#independent t-test
library(MASS)
t.test(Prob ~ So, data=UScrime)
#拒绝南方各州和非南方各州拥有相同监禁概率的假设

# dependent t-test
library(MASS)
sapply(UScrime[c("U1", "U2")], function(x) (c(mean = mean(x), 
                                              sd = sd(x))))
with(UScrime, t.test(U1, U2, paired = TRUE))
#差异的均值（61.5）足够大，可以保证拒绝年长和年轻男性的平均失业率相同的假设。
#年轻男性的失业率更高。事实上，若总体均值相等，获取一个差异如此大的样本的概率小于
#2.2*e^16。

#Wilcoxon two group comparison
with(UScrime, by(Prob, So, median))
wilcox.test(Prob ~ So, data=UScrime)
sapply(UScrime[c("U1", "U2")], median)
with(UScrime, wilcox.test(U1, U2, paired = TRUE))

# Kruskal Wallis test
states <- as.data.frame(cbind(state.region, state.x77))
kruskal.test(Illiteracy ~ state.region, data=states)