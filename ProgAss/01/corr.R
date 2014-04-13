corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

	correlation = numeric()
	
	for (i in 1:332) {
		
		# First get the correct filenames
		if (i %/% 100 != 0){
			filename <- paste(as.character(i), '.csv', sep='')
		}
		else if (i %/% 10 != 0){
			filename <- paste('0', as.character(i), '.csv', sep = '')
		}
		else{
			filename <- paste('00', as.character(i), '.csv', sep = '')
		}

		filename <- paste(directory, '/', filename, sep = '')
		
		data = read.csv(filename)

		good = complete.cases(data)

		if (sum(good) > threshold){
			corr_i = cor(data$sulfate[good], data$nitrate[good])
			correlation = c(correlation, corr_i)	
		
		}
	}

	correlation

}
