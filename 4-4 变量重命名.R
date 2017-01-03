# Renaming variables with the reshape package
library(reshape)
rename(leadership, c(manager = "managerID", date = "testDate"))

#ÁíÒ»ÖÖ
names(leadership)[2]="testdate"
names(leadership)[5:9]=c("Item1","Item2","Item3","Item4","Item5")