complete <- function(directory, id = 1:332) {
	data <- data.frame()
	for (i in id) {
		if (i < 10) prefix = '00' else if (i < 100) prefix = '0' else prefix = ''
		file_name <- paste(directory, '/', prefix, as.character(i), '.csv', sep='')
		df <- read.csv(file_name)
		completeness <- !is.na(df["sulfate"]) & !is.na(df["nitrate"])
		complete_rows <- sum(completeness)
		new_data <- data.frame(id = i, nobs = complete_rows)
		data <- rbind(data, new_data)
	}
	data
}