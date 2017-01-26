#我们直接给出可以画出均值和标准差的图片（用ggplot2包）
library(ggplot2)
attach(ToothGrowth)
#此处我们使用melt和cast算出均值和方差
library("reshape")
library("reshape2")

tgc <-melt(ToothGrowth, id.vars = c("supp","dose"))
tgc
tgmean= cast(tgc, supp+dose ~ variable, mean, na.rm=T)
tgsd=cast(tgc,supp+dose ~ variable, sd, na.rm=T)
detach(ToothGrowth)
g=split(ToothGrowth,ToothGrowth[,c("dose","supp")],drop=TRUE)
tgse=NULL
tgci=NULL
ciMult=NULL
n=sapply(g,nrow)
#计算拆分后的每个单元数据数
for (i in 1:length(g)){
  tgse[i]=tgsd[i,3]/sqrt(n[i])
  ciMult[i]=qt(0.95/2 + .5, n[i]-1)
  tgci[i]=tgse[i] * ciMult[i]
}

tgmeansd=cbind(tgmean[,1:2],n,tgmean[,3],tgsd$len,tgse,tgci)
colname=c("supp","dose","N","len","sd","se","ci")
#N:有效数据量，len:均值，sd标准差，se方差，ci:95%置信区间
#ci 和se可用library(pastecs)中的stat.desc()函数得出，此函数可以此题中得到
#所需所有内容
colnames(tgmeansd)=colname
#整合并输出求得的值，修改变量名称
tgc=tgmeansd
tgc
#首先画折线图
library(ggplot2)
#ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#  geom_errorbar(aes(ymin=len-se, ymax=len+se), width=.1) +
#  geom_line() +
#  geom_point()


# The errorbars overlapped, so use position_dodge to move them horizontally
pd <- position_dodge(0.1) # move them .05 to the left and right

#ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#  geom_errorbar(aes(ymin=len-se, ymax=len+se), width=.1, position=pd) +
#  geom_line(position=pd) +
#  geom_point(position=pd)


# Use 95% confidence interval instead of SEM
#ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#  geom_errorbar(aes(ymin=len-ci, ymax=len+ci), width=.1, position=pd) +
#  geom_line(position=pd) +
#  geom_point(position=pd)

# Black error bars - notice the mapping of 'group=supp' -- without it, the error
# bars won't be dodged!
#ggplot(tgc, aes(x=dose, y=len, colour=supp, group=supp)) + 
#  geom_errorbar(aes(ymin=len-ci, ymax=len+ci), colour="black", width=.1, position=pd) +
#  geom_line(position=pd) +
#  geom_point(position=pd, size=3)

#最后修饰成品如下
ggplot(tgc, aes(x=dose, y=len, colour=supp, group=supp)) + 
  geom_errorbar(aes(ymin=len-se, ymax=len+se), colour="black", width=.1, position=pd) +
  geom_line(position=pd) +
  geom_point(position=pd, size=3, shape=21, fill="white") + # 21 is filled circle
  xlab("Dose (mg)") +
  ylab("Tooth length") +
  scale_colour_hue(name="Supplement type",    # Legend label, use darker colors
                   breaks=c("OJ", "VC"),
                   labels=c("Orange juice", "Ascorbic acid"),
                   l=40) +                    # Use darker colors, lightness=40
  ggtitle("The Effect of Vitamin C on\nTooth Growth in Guinea Pigs") +
  expand_limits(y=0) +                        # Expand y range
  scale_y_continuous(breaks=0:20*4) +         # Set tick every 4
  theme_bw() +
  theme(legend.justification=c(1,0),
        legend.position=c(1,0))               # Position legend in bottom right

#接下来画条形图
tgc2 <- tgc
tgc2$dose <- factor(tgc2$dose)

# Error bars represent standard error of the mean
#ggplot(tgc2, aes(x=dose, y=len, fill=supp)) + 
#  geom_bar(position=position_dodge(), stat="identity") +
#  geom_errorbar(aes(ymin=len-se, ymax=len+se),
#                width=.2,                    # Width of the error bars
#                position=position_dodge(.9))


# Use 95% confidence intervals instead of SEM
#ggplot(tgc2, aes(x=dose, y=len, fill=supp)) + 
#  geom_bar(position=position_dodge(), stat="identity") +
#  geom_errorbar(aes(ymin=len-ci, ymax=len+ci),
#                width=.2,                    # Width of the error bars
#               position=position_dodge(.9))

#成品如下
ggplot(tgc2, aes(x=dose, y=len, fill=supp)) + 
  geom_bar(position=position_dodge(), stat="identity",
           colour="black", # Use black outlines,
           size=.3) +      # Thinner lines
  geom_errorbar(aes(ymin=len-se, ymax=len+se),
                size=.3,    # Thinner lines
                width=.2,
                position=position_dodge(.9)) +
  xlab("Dose (mg)") +
  ylab("Tooth length") +
  scale_fill_hue(name="Supplement type", # Legend label, use darker colors
                 breaks=c("OJ", "VC"),
                 labels=c("Orange juice", "Ascorbic acid")) +
  ggtitle("The Effect of Vitamin C on\nTooth Growth in Guinea Pigs") +
  scale_y_continuous(breaks=0:20*4) +
  theme_bw()

