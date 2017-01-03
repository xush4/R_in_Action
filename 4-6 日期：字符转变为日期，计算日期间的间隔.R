#2017-1-2 P74/99
#符合条件的字符可直接转化
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
#计算日期差、周数差：difftime函数+as.numeric 转换为数字(as.character转回文字）
Datelength=as.numeric(mydates[1]-mydates[2])
Weeklength=as.numeric(difftime(mydates[1],mydates[2],units="week"))

# Converting character values to dates
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")

#观察leadership(参见4-1)原数据中的日期：“月/日/年”格式，使用as.Date读取：
myformat <- "%m/%d/%y"
leadership$date <- as.Date(leadership$date, myformat)

#当前日期
Sys.Date()
date()
# %d 数字表示的日期（0~31） 01~31
# %a 缩写的星期名 Mon
# %A 非缩写星期名 Monday
# %m 月份（00~12） 00~12
# %b 缩写的月份 Jan
# %B 非缩写月份 January
# %y 两位数的年份 07
# %Y 四位数的年份

#例如输出周几：
today=Sys.Date()
format(today, format = "%A")
