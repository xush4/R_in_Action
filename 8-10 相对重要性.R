source("E:/Dropbox/Data Science/R_in_Action/8-10 relweights函数：相对重要性.txt")
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
relweights(fit, col="blue")
#lliteracy解释了59%的R平方，Frost解释了20.79%，等等。根据相对权重法，，Illiteracy有最
#大的相对重要性，余下依次是Frost、Population和Income。