setwd("C:/Users/Pin-Wei/Documents/accelerometer_project/")
wb <- read.csv("SecondTry.csv")

x.p <- ggplot(wb, aes(Time, R.X)) + geom_point()
y.p <- ggplot(wb, aes(Time, R.Y)) + geom_point()
z.p <- ggplot(wb, aes(Time, R.Z)) + geom_point()

x.y <- wb$R.X*wb$R.Y
y.z <- wb$R.Y*wb$R.Z
x.z <- wb$R.X*wb$R.Z

t <- wb$Time