<<<<<<< HEAD
#2017/1/1 P30（54）
g="My First List"
h=c(25,26,18,39)
j=matrix(1:10,nrow=20,ncol=2)#自动填充
k=matrix(1:10,nrow=5)
l=c("one","two","three")
mylist=list(tittle=g,ages=h,j,k,l)
#四个元素：元素一的名称是tittle内容是g，元素二的名称是ages内容是h
#元素三、四、五没有名称，内容是h,j,k。
mylist[[2]]
=======
#2017/1/1 P30（54）
g="My First List"
h=c(25,26,18,39)
j=matrix(1:10,nrow=20,ncol=2)#自动填充
k=matrix(1:10,nrow=5)
l=c("one","two","three")
mylist=list(tittle=g,ages=h,j,k,l)
#四个元素：元素一的名称是tittle内容是g，元素二的名称是ages内容是h
#元素三、四、五没有名称，内容是h,j,k。
mylist[[2]]
>>>>>>> origin/master
mylist[["ages"]]#2和ages两者对应的内容一致