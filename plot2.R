source('loadData.R')

plot2 <- function(data, ylab = 'Global Active Power (kilowatts)') {
  with(data, {
       plot(datetime, Global_active_power,
	    type = 'n',
	    xlab = '',
	    ylab = ylab)
       lines(datetime, Global_active_power)
  })
}

plot2.png <- function () {
  data <- load.data()

  png(filename = 'plot2.png', bg = 'transparent')
  plot2(data)
  dev.off()
}
