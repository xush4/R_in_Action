library(sqldf)
newdf <- sqldf("select * from mtcars where carb=1 order by mpg", 
               row.names = TRUE)
#从数据框mtcars中选择了所有的变量（列），保留了那些使用化油器
#（carb）的车型（行），按照mpg对车型进行了升序排序，并将结果保存为数据框newdf。
newdf <- sqldf("select avg(mpg) as avg_mpg, avg(disp) as avg_disp,
    gear from mtcars where cyl in (4, 6) group by gear")
#输出了四缸和六缸车型不同gear水平的mpg和disp的平均值。