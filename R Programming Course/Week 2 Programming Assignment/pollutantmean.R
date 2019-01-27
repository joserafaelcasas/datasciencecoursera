pollutantmean <- function(directory, pollutant, id= 1:332) {
	data <- data.frame()
	for (i in id) {
		if (i < 10) prefix = '00' else if (i < 100) prefix = '0' else prefix = ''
		file_name = paste(directory, '/', prefix, as.character(i), '.csv', sep='')
		df = read.csv(file_name)
		data <- rbind(data, df)
	}
	mean(data[,pollutant], na.rm = TRUE)
}