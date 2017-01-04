mydata <- matrix(rnorm(30), nrow=6)
mydata
apply(mydata, 1, mean) #行均值    
apply(mydata, 2, mean) #列均值
apply(mydata, 2, mean, trim=.2) 
#trim: 设置为0.2时，截尾均值基于中间60%的数据，最高和最低20%的值均被忽略