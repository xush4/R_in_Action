x <- c(1:10)
y <- x
z <- 10/x
opar <- par(no.readonly = TRUE)
par(mar = c(5, 4, 4, 8) + 0.1)

plot(x, y, type = "b", pch = 21, col = "red", yaxt = "n", 
     lty = 3, ann = FALSE)
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)
#添加一条线
axis(side=2, at = x, labels = x, col.axis = "red", las = 2)
#side:图形边框：1下，2左，3上，4右
#at:刻度位置，las：标签平行=0/垂直=2坐标轴
axis(side=4, at = z, labels = round(z, digits = 2), col.axis = "blue", 
     las = 2, cex.axis = 0.7, tck = -0.01)
mtext("y=10/x", side = 4, line = 3, cex.lab = 1, las = 0, 
      col = "blue")
#mtext添加文字
title("An Example of Creative Axes", xlab = "X values", 
      ylab = "y=x")
par(opar)