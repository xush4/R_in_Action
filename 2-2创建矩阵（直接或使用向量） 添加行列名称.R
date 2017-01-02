y=matrix(1:20, nrow=5,ncol=4) #五行四列，按列填充（先填满一列，在填下一列）
cells=c(1,26,24,68)
rnames=c("R1","R2")
cnames=c("C1","C2")
mymatrix=matrix(cells,nrow=2,ncol=2,byrow=TRUE,dimnames=list(rnames,cnames))#两行两列按行填充
