#转置
cars <- mtcars[1:5, 1:4]      
cars
t(cars)

#整合（同类数据运算）
options(digits=3)
attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,gear), 
                    FUN=mean, na.rm=TRUE)
#根据cyl（档位数量）和gear（汽缸数量）进行整合，输出均值
#即cyl和gear相同的汽车归入一类，并对同类的数据求均值，再按cyl，gear排序
aggdata