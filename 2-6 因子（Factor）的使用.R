<<<<<<< HEAD
ID=c(1,2,3,4,5,6)
age=c(25,34,28,52,30,21)
disease=c("sore throat","fever","fever","sore throat","sore throat","fever")
status=c("good","poor","improved","improved","poor","improved")
patientdata=data.frame(ID,age,disease,status)#创建数据框
status <- factor(status, ordered=TRUE)#(依照字母顺序排序，并转化为数字)
str(patientdata)#显示结构
summary(patientdata)#summary中也是“依照字母顺序排序，并转化为数字”

=======
ID=c(1,2,3,4,5,6)
age=c(25,34,28,52,30,21)
disease=c("sore throat","fever","fever","sore throat","sore throat","fever")
status=c("good","poor","improved","improved","poor","improved")
patientdata=data.frame(ID,age,disease,status)#创建数据框
status <- factor(status, ordered=TRUE)#(依照字母顺序排序，并转化为数字)
str(patientdata)#显示结构
summary(patientdata)#summary中也是“依照字母顺序排序，并转化为数字”

>>>>>>> origin/master
