id1 <- c(2, 3, 4, 5, 7)
heights <- c(62, 65, 71, 71, 67)
df1 <- data.frame(id = id1, heights)
id2 <- c(1, 2, 6:10)
weights <- c(147, 113, 168, 135, 142, 159, 160)

#添加列：Merge函数示例
df2 <- data.frame(id = id2, weights)
data1 = merge(df1, df2, by="id", all = FALSE)
#合并相同ID项，输出heights和weights都有数据的项
data2 = merge(df2, df1, by="id", all = FALSE)
#结果与之前相同，但是heights与weights的顺序颠倒
data3 = merge(df2, df1, by="id", all = TRUE)
#输出所有结果，没有数据的填充NA

#直接合并列：cbind()
cbind(leadership,leadership)
#直接合并行：rbind()
rbind(leadership,leadership)
