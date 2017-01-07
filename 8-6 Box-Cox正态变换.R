# Box-Cox正态变换
library(car)
summary(powerTransform(states$Murder))
#结果表明，你可以用Murder^0.6来正态化变量Murder。由于0.6很接近0.5，你可以尝试用平方
#根变换来提高模型正态性的符合程度。
#但在本例中，λ=1的假设也无法拒绝（p=0.145），因此没有强有力的证据表明本例需要变量变换
library(car)
boxTidwell(Murder~Population+Illiteracy,data=states)
#结果显示，使用变换Population^0.87和Illiteracy^1.36能够大大改善线性关系。但是对
#Population（p=0.75）和Illiteracy（p=0.54）的计分检验又表明变量并不需要变换。