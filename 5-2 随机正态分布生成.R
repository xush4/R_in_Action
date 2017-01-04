#画出标准状态曲线
x <- pretty(c(-3,3), 30)
#在 -3 到 3 之间，每0.2生成一个数（生成30+1个数据）
y <-dnorm(x)
plot(x, y,
     type="l",
     xlab="NormalDeviate",
     ylab="Density",
     yaxs="i"
)

#输出符合正态分布的伪随机数
runif(5)
runif(5)
set.seed(1234)                                                     
runif(5)
#seed设定后输出的值不会改变
set.seed(1234)                                                      
runif(5)
