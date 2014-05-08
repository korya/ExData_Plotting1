source('loadData.R')

plot1 <- function (data) {
  with(data, {
       hist(Global_active_power,
	    xlab = 'Global Active Power (kilowatts)',
	    main = 'Global Active Power',
	    col = 'red')
  })
}

plot1.png <- function () {
  data <- load.data()

  png(filename = 'plot1.png', bg = 'transparent')
  plot1(data)
  dev.off()
}
