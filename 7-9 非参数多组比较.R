# 非参数多组比较

class <- state.region
var <- state.x77[, c("Illiteracy")]
mydata <- as.data.frame(cbind(class, var))
rm(class,var)
library(npmc)
#The npmc package is not available after 3.1.0. But HeKe Zhang has rewritten it.
#The package is in my file. You can install it directly with "npmc.zip".
#For Copyrights and other information Please visit:
#https://github.com/HK-Zhang/Rice/tree/master/npmc
summary(npmc(mydata), type = "BF")
#调用了npmc的语句生成了六对统计比较结果（1东北部对2南部、1东北部对3中北部、1东北部对
#4西部、2南部对3中北部、2南部对4西部，以及3中北部对4西部）
#可以从双侧的p值（p.value.2s）看(P<0.05)
#出南部与其他三个地区显著不同，而其他三个地区之间并没有什么不同。
aggregate(mydata, by = list(mydata$class), median)

#In version 2 there's a "wmc" function:
#We download it in the file.
source("E:/Dropbox/Data Science/R_in_Action/7-9 wmc函数.txt")
states <- data.frame(state.region, state.x77)
wmc(Illiteracy ~ state.region, data=states, method="holm")
