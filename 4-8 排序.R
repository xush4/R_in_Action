attach(leadership) #leadership参见4-1
newdata1 <- leadership[order(leadership$age), ]#按照年龄排序（升序）
newdata1
newdata2 = leadership[order(leadership$gender, -leadership$age), ]
#先按照性别排序（升序F到M），再按照年龄（降序）排列
newdata2
detach(leadership)