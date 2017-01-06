# Listing 7.13 - Chis-square test of independence

library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
chisq.test(mytable)
#取p值0.01 治疗方法与改善情况相关
mytable <- xtabs(~Improved+Sex, data=Arthritis)
chisq.test(mytable)
#取p值0.01 性别与改善情况无关

# Fisher's exact test
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
fisher.test(mytable)

# Chochran-Mantel-Haenszel test
mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
mantelhaen.test(mytable)
#结果表明，性别相同时，患者接受的治疗与得到的改善并不独立（即，分性别来看，
#用药治疗的患者较接受安慰剂的患者都有了更多的改善）。

#相关性度量
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
assocstats(mytable)