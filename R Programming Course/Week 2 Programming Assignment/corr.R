corr <- function(directory, threshold = 0) {
	files <- dir("specdata", pattern = ".csv")
	for (i in 1:length(files)) {
		file_id <- as.numeric(file_numbers[[i]][1])
		if (complete(directory, file_id)[2] >= threshold) {
			if (file_id < 10) prefix = '00' else if (file_id < 100) prefix = '0' else prefix = ''
			file_name <- paste(directory, '/', prefix, as.character(file_id), '.csv', sep='')
			df <- read.csv(file_name)
			this_corr <- cor(df["nitrate"], df["sulfate"], use="pairwise.complete.obs")
			if(exists("cor_values")) {
				cor_values = c(cor_values, this_corr)
			}
			else {
				cor_values = this_corr
			}
		}
	}
	if(exists("cor_values")) cor_values else vector('numeric')
}