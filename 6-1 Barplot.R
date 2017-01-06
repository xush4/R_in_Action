#Barplot
# pause after each graph
par(ask = TRUE)

# save original graphic settings
opar <- par(no.readonly = TRUE)

# Load vcd package
library(vcd)

# Get cell counts for improved variable
counts <- table(Arthritis$Improved)
counts

# simple bar plot 绘制单一变量
barplot(counts, main = "Simple Bar Plot", xlab = "Improvement", ylab = "Frequency")

# horizontal bar plot （横向）
barplot(counts, main = "Horizontal Bar Plot", xlab = "Frequency", 
        ylab = "Improvement", horiz = TRUE)

#绘制多个变量
# get counts for Improved by Treatment table
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts
# stacked barplot 按照治疗方法分（安慰剂、实际治疗）
barplot(counts, main = "Stacked Bar Plot", xlab = "Treatment", 
        ylab = "Frequency", col = c("red", "yellow", "green"), 
        legend = rownames(counts))

# grouped barplot 按照治疗效果分（显著、一般、无效）
barplot(counts, main = "Grouped Bar Plot", xlab = "Treatment", 
        ylab = "Frequency", col = c("red", "yellow", "green"), 
        legend = rownames(counts), 
        beside = TRUE)
