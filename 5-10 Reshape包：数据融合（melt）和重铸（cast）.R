#merge 见4-9
#使用R自带的airquality数据阐明melt和cast的用法：
#首先了解airquality的数据情况
head(airquality)
#使用melt函数：
library("reshape")
library("reshape2")
aql <-melt(airquality, id.vars = c("Month","Day"), variable.name ="climate_variable", value.name ="climate_value")
#把各项天气情况据数据分开，对于每一项气象状况按月、日排序。
head(aql)
aqw <- cast(aql, Month + Day ~ variable)
#把数据按月日整合回去
head(aqw)
#数据算平均值(此处如果报错建议清空workspace，主要原因是变量冲突)
cast(aql, Month ~ variable, mean, na.rm=T)#按月算各个天气均值