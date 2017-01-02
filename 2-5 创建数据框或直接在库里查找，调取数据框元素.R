<<<<<<< HEAD
ID=c(1,2,3,4,5,6)
age=c(25,34,28,52,30,21)
disease=c("sore throat","fever","fever","sore throat","sore throat","fever")
status=c("improved","poor","improved","improved","poor","improved")
patientdata=data.frame(ID,age,disease,status)#创建数据框
#patientdata=data.frame(ID,age,disease,status,row.names=age)
#使用row.names直接定义每一行的名称
patientdata
patientdata[1:2]#选取第一第二项数据
patientdata[c("ID","status")]#选取ID 和 staus两项数据
patientdata$age#单独选取age项
table(patientdata$disease, patientdata$status)#查找disease和status的关系
attach(mtcars)#用attach直接从R的包里调出mtcars
summary(mpg)#查看基本情况，特定数据（均值、方差）可参考1-1
plot(mpg,wt)#散点图
detach(mtcars)#结束调取/调取完毕
#调取数据时需要保证调取的数据和Global已经有的数据不重名，否则以Global为准。
with(mtcars,{   #用with从R的包里调出mtcars
  stats=summary(mpg)
  stats
})
stats#Error: object 'stats' not found
#当使用“=”或者“<-”时，变量stats是临时变量，不会出现在Glabal里。
#如果要定义Global变量，请使用<<-
with(mtcars,{   
  stats<<-summary(mpg)
  stats
})
stats


=======
ID=c(1,2,3,4,5,6)
age=c(25,34,28,52,30,21)
disease=c("sore throat","fever","fever","sore throat","sore throat","fever")
status=c("improved","poor","improved","improved","poor","improved")
patientdata=data.frame(ID,age,disease,status)#创建数据框
#patientdata=data.frame(ID,age,disease,status,row.names=age)
#使用row.names直接定义每一行的名称
patientdata
patientdata[1:2]#选取第一第二项数据
patientdata[c("ID","status")]#选取ID 和 staus两项数据
patientdata$age#单独选取age项
table(patientdata$disease, patientdata$status)#查找disease和status的关系
attach(mtcars)#用attach直接从R的包里调出mtcars
summary(mpg)#查看基本情况，特定数据（均值、方差）可参考1-1
plot(mpg,wt)#散点图
detach(mtcars)#结束调取/调取完毕
#调取数据时需要保证调取的数据和Global已经有的数据不重名，否则以Global为准。
with(mtcars,{   #用with从R的包里调出mtcars
  stats=summary(mpg)
  stats
})
stats#Error: object 'stats' not found
#当使用“=”或者“<-”时，变量stats是临时变量，不会出现在Glabal里。
#如果要定义Global变量，请使用<<-
with(mtcars,{   
  stats<<-summary(mpg)
  stats
})
stats


>>>>>>> origin/master
