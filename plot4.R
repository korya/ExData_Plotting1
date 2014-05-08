source('loadData.R')
source('plot1.R')
source('plot2.R')

plot4.2 <- function (data) {
  with(data, {
       plot(datetime, Voltage, type = 'n')
       lines(datetime, Voltage)
  })
}

plot4.4 <- function (data) {
  with(data, {
       plot(datetime, Global_reactive_power, type = 'n')
       lines(datetime, Global_reactive_power)
  })
}

plot4 <- function (data) {
  par(mfrow = c(2, 2))
  plot2(data, ylab = 'Global Active Power')
  plot4.2(data)
  plot3(data, bty = 'n')
  plot4.4(data)
}

plot4.png <- function () {
  data <- load.data()

  png(filename = 'plot4.png', bg = 'transparent')
  plot4(data)
  dev.off()
}
