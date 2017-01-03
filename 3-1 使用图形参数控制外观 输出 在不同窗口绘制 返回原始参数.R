#例一：输出PDF/JPEG P40/67
setwd("E:/Dropbox/Data Science/R_in_Action")#首先设置目录
pdf("Graph3-1.pdf")#输出PDF
attach(mtcars)
  plot(wt,mpg)
  abline(lm(mpg~wt))
  title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

jpeg("Graph3-1.jpg", width = 480, height = 480)#输出jpg
  attach(mtcars)
  plot(wt,mpg)
  abline(lm(mpg~wt))
  title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

#不同窗口 dev.new

#例二 plot 函数
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar=par(no.readonly=TRUE) #保存原始设置
par(pin=c(2,3)) #2英寸宽，3英寸高
par(lwd=2, cex=1.5)#线宽是默认的2倍，标识（数据点）大小是默认的1.5倍
par(cex.axis=0.75, font.axis=4)#坐标刻度文字大小是默认的3/4，并斜体
#font.axis:2加粗，3斜体，4加粗加斜
plot(dose, drugA, type="b",pch=19, lty=2, col ="red", main="Dose vs DrugA",
     xlab="Dose", ylab="Drug A"，xlim=c(0,60),ylim=c(0,70))
#type:b-点线图
#pch对应图形，lty对应线形（参考《R语言实战（中文版）》P45-46）。
#main:标题，xlab：x轴，xlim：坐标范围
#col线的颜色
plot(dose, drugB, type="b",pch=21, lty=5, col ="blue",bg="green")
#bg 空心点的填充颜色
par(opar)#恢复初始设置

