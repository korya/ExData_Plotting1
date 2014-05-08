source('loadData.R')

plot3 <- function (data, bty = 'o') {
  with(data, {
       plot(datetime, Sub_metering_1,
	    type = 'n',
	    xlab = '',
	    ylab = 'Energy sub metering')
       lines(datetime, Sub_metering_1, col = 'black')
       lines(datetime, Sub_metering_2, col = 'red')
       lines(datetime, Sub_metering_3, col = 'blue')
       legend('topright',
	      lty = 1,
	      bty = bty,
	      legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
	      col = c('black', 'red', 'blue'))
  })
}

plot3.png <- function () {
  data <- load.data()

  png(filename = 'plot3.png', bg = 'transparent')
  plot3(data)
  dev.off()
}
