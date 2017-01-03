# 寻找缺失值is.na() 
is.na(leadership[, 6:10])

# 年龄99为异常值，替换为NA
leadership[leadership$age == 99, "age"] <- NA
leadership

# 去掉NA值na.omit()
newdata <- na.omit(leadership)
newdata