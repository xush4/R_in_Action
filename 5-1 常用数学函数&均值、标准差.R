#abs(x)     绝对值              abs(-4)返回值为4
#sqrt(x)    平方根              sqrt(25)返回值为5 和25^(0.5)等价
#ceiling(x) 不小于x的最小整数   ceiling(3.475)返回值为4
#floor(x)   不大于x的最大整数   floor(3.475)返回值为3
#trunc(x)   向 0 的方向截取的x中的整数部分 trunc(5.99)返回值为5

#round(x, digits=n)  将x舍入为指定位的小数       round(3.475, digits=2)返回值为3.48
#signif(x, digits=n) 将x舍入为指定的有效数字位数 signif(3.475, digits=2)返回值为3.5
#cos(x)、sin(x) 、tan(x) 余弦、正弦和正切        cos(2)返回值为–0.416
#acos(x) 、asin(x) 、atan(x) 反余弦、反正弦和反正切 acos(-0.416)返回值为2
#cosh(x) 、sinh(x) 、tanh(x) 双曲余弦、双曲正弦和双曲正切 sinh(2)返回值为3.627
#acosh(x) 、asinh(x) 、atanh(x) 反双曲余弦、反双曲正弦和反双曲正切 asinh(3.627)返回值为2
# log(x,base=n) 对x取以n为底的对数
# 为了方便起见 log(x)   log(x)为自然对数    log(10)返回值为2.3026
#              log10(x) log10(x)为常用对数  log10(10)返回值为1
#exp(x) 指数函数 exp(2.3026)返回值为10

#mean(x) 平均数
mean(c(1,2,3,4))#返回值为2.5
#median(x) 中位数
median(c(1,2,3,4))#返回值为2.5
#sd(x) 标准差
sd(c(1,2,3,4))#返回值为1.29
#var(x) 方差
var(c(1,2,3,4))#返回值为1.67
#mad(x) 绝对中位差（median absolute deviation）
mad(c(1,2,3,4))#返回值为1.48
#quantile(x,probs) 求分位数。其中x为待求分位数的数值型向量，probs为一个由[0,1]
#之间的概率值组成的数值向量
# 求x的30%和84%分位点
y <- quantile(x, c(.3,.84))
#range(x) 求值域
x <- c(1,2,3,4)
range(x)#返回值为c(1,4)
diff(range(x))#返回值为3
#sum(x) 求和
sum(c(1,2,3,4))#返回值为10
diff(x, lag=n) #滞后差分，lag用以指定滞后几项。默认的lag值为1
x<- c(1, 5, 23, 29)
diff(x)#返回值为c(4, 18, 6)
#min(x) 求最小值
min(c(1,2,3,4))#返回值为1
#max(x) 求最大值
max(c(1,2,3,4))#返回值为4
#scale(x,center=TRUE,
      scale=TRUE)
#为数据对象x按列进行中心化（center=TRUE）或标准化（center=TRUE,scale=TRUE）；
#代码清单5-6中给出了一个示例

x <- c(1, 2, 3, 4, 5, 6, 7, 8)
mean(x)
sd(x)
n <- length(x)
meanx <- sum(x)/n
css <- sum((x - meanx)**2)            
sdx <- sqrt(css / (n-1))
meanx
sdx