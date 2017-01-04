#示例 给学生打分，并按Last Name输出：
options(digits=2) #小数点后两位
Student <- c("John Davis", "Angela Williams", 
             "Bullwinkle Moose", "David Jones", 
             "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")
#输入姓名、各科成绩
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
                     stringsAsFactors=FALSE)
#把姓名成绩存储到roster
z <- scale(roster[,2:4])
#依照正态分布scale一下
score <- apply(z, 1, mean)
#算出每一行的均值
roster <- cbind(roster, score)
#把均值（列）合并入roster
y <- quantile(score, c(.8,.6,.4,.2)) 
#求出0.8（前20%），0.6，0.4，0.2分位数
roster$grade[score >= y[1]] <- "A"                                     
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"
#给出等第
name <- strsplit((roster$Student), " ")  
#字符分割
lastname <- sapply(name, "[", 2)
firstname <- sapply(name, "[", 1)

roster <- cbind(firstname,lastname, roster[,-1])
roster <- roster[order(lastname,firstname),]
#排序

roster