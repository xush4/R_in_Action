# 三位频数表

mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
mytable
ftable(mytable)
margin.table(mytable, 1)
margin.table(mytable, 2)
margin.table(mytable, 3)
margin.table(mytable, c(1,3))
ftable(prop.table(mytable, c(1, 2)))
ftable(addmargins(prop.table(mytable, c(1, 2)), 3))
#第3行代码生成了三维分组各单元格的频数。这段代码同时演示了如何使用ftable()函
#数输出更为紧凑和吸引人的表格。
#第5代码将结果重新整合，输出比较美观
#第6代码为治疗情况（Treatment）、性别（Sex）和改善情况（Improved）生成了边
#际频数。由于使用公式~Treatement+Sex+Improve创建了这个表，所以Treatment需要通过
#下标1来引用，Sex通过下标2来引用，Improve通过下标3来引用。
#第7行代码为治疗情况（Treatment） × 改善情况（Improved）分组的边际频数，由不
#同性别（Sex）的单元加和而成。每个Treatment × Sex组合中改善情况为None、Some和Marked
#患者的比例由给出。在这里可以看到治疗组的男性中有36%有了显著改善，女性为59%。

gtable(addmargins(prop.table(mytable, c(1, 2)), 3)) * 100
#如果想得到百分比而不是比例，可以将结果表格乘以100