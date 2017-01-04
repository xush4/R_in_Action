mystats <- function(x, parametric=TRUE, print=FALSE) {
#默认值，parametric：TRUE，print：FALSE
  if (parametric) {
    center <- mean(x); spread <- sd(x) 
  } else {
    center <- median(x); spread <- mad(x) 
  }
  if (print & parametric) {
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center=center, spread=spread)
  return(result)
}

# trying it out
set.seed(1234)
x <- rnorm(500) 
y <- mystats(x)
y <- mystats(x, parametric=FALSE, print=TRUE)

# Another switch example
mydate <- function(type="long") {
#如果未指定type，则long将为默认的日期格式：
  switch(type,
         long =  format(Sys.time(), "%A %B %d %Y"), 
         short = format(Sys.time(), "%m-%d-%y"),
         cat(type, "is not a recognized type\n"))
#cat()仅会在输入的日期格式类型不匹配"long"或"short"时执行。
}
mydate("long")
mydate("short")
mydate()
mydate("medium")