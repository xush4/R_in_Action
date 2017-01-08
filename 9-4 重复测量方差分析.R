#北方和南方牧草类植物Echinochloa crus-galli 的耐寒度研究结果，在某浓度二氧化碳的环境
#中，对寒带植物与非寒带植物的光合作用率进行了比较。
CO2$conc <- factor(CO2$conc)
w1b1 <- subset(CO2, Treatment=='chilled')
fit <- aov(uptake ~ (conc*Type) + Error(Plant/(conc)), w1b1)
summary(fit)
#方差分析表表明在0.01的水平下，主效应类型和浓度以及交叉效应类型×浓度都非常显著，
par(las=2)
par(mar=c(10,4,4,2))
with(w1b1, 
     interaction.plot(conc,Type,uptake, 
                      type="b", col=c("red","blue"), pch=c(16,18),
                      main="Interaction Plot for Plant Type and Concentration"))
boxplot(uptake ~ Type*conc, data=w1b1, col=(c("gold","green")),
        main="Chilled Quebec and Mississippi Plants", 
        ylab="Carbon dioxide uptake rate (umol/m^2 sec)")
par(opar)
#从以上任意一幅图都可以看出，魁北克省的植物比密西西比州的植物二氧化碳吸收率高，而
#且随着CO2浓度的升高，差异越来越明显。