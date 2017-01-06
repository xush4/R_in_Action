# get Arthritis data
library(vcd)

#一维列联表
#简单统计数量/频数
mytable <- with(Arthritis, table(Improved))
mytable #次数
prop.table(mytable)#比率（小数）
prop.table(mytable)*100#比率（百分比）

#二维列联表
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable 
margin.table(mytable, 1)#对于列项的统计（次数）
prop.table(mytable, 1)#对于列项的统计（比率）
margin.table(mytable, 2)#对于行项的统计（次数）
prop.table(mytable, 2)#对于行项的统计（比率）
prop.table(mytable)#各项统计（比率）
addmargins(mytable)#边际统计（数量）：各项统计+各项总和
addmargins(prop.table(mytable))
addmargins(prop.table(mytable, 1), 2)
addmargins(prop.table(mytable, 2, 1)
           
 # Listing 7.11 - Two-way table using CrossTable
           
library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)
#Cell Contents
#|-------------------------|
#  |                       N |
#  | Chi-square contribution |
#  |           N / Row Total |
#  |           N / Col Total |
#  |         N / Table Total |
#  |-------------------------|
  