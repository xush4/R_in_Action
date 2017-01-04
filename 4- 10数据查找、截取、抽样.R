myvars <- paste("q", 1:5, sep = "") #使用paste函数创建查找项目名称
newdata1 <- leadership[,c(5:9)]
newdata2 <- leadership[myvars] #直接依靠变量（向量）提取部分数据

#数据删除
newdata1=leadership[,c(-8,-9)]#删除第8第9列
rawdata=leadership
rawdata$q3=NULL; rawdata$q4=NULL #使用NULL赋值删除q3和q4

#数据选取：which函数
newdata <- leadership[which(leadership$gender == "M" & leadership$age > 30), ]
#选择30以上男性
leadership$date <- as.Date(leadership$date, "%m/%d/%y")
startdate <- as.Date("2009-01-01")
enddate <- as.Date("2009-10-31")
newdata <- leadership[leadership$date >= startdate & 
                        leadership$date <= enddate, ]
#选取一段时间内的数据

#数据选取：subset函数
newdata <- subset(leadership, age >= 35 | age < 24, 
                  select = c(q1, q2, q3, q4))
newdata <- subset(leadership, gender == "M" & age > 
                    25, select = gender:q4)

#抽样：sample函数
mysample1=leadership[sample(1:nrow(leadership),2,replace=FALSE),]
mysample2=leadership[sample(1:nrow(leadership),2,replace=FALSE),]
#首先使用sample函数在指定向量中选取某2个数字，replace=FALSE表示不可以重复选取
#然后输出这些行。
#需要注意的是sample还可以指定几率：
x=c("Front","Back")
sample(x,size=200,replace=T,prob=c(0.8,0.2))
#抛硬币，正面朝上0.8，反面朝上0.2抛200次。
