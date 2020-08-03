install.packages("ggplot2")
library(ggplot2)
p<-ggplot(data=mtcars, aes(x=disp, y=mpg)) + geom_point(aes(size=hp, color=wt))

p+stat_smooth(color ='black',fill='grey') + facet_wrap(cyl~.)

ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line(color = "orange", lwd = 1)
