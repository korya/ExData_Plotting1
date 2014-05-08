download.data <- function () {
  data.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  data.zip.file <- 'data.zip'

  if (!file.exists(data.zip.file)) {
    download.file(data.url, method = 'curl', destfile = data.zip.file)
    unzip(data.zip.file)
  }
}

read.data <- function () {
  data <- read.table('household_power_consumption.txt', header=T, sep=';',
		     na.strings='?', stringsAsFactors=F)
  data$datetime <- strptime(paste(data$Date, data$Time, ' '), '%d/%m/%Y %H:%M:%S')
  date.from <- strptime('2007-02-01', '%Y-%m-%d')
  date.to <- strptime('2007-02-03', '%Y-%m-%d')
  data <- subset(data, date.from <= data$datetime & data$datetime < date.to)
  data
}

cached.data <- NULL
load.data <- function () {
  if (is.null(cached.data)) {
    download.data()
    cached.data <<- read.data()
  }
  cached.data
}
