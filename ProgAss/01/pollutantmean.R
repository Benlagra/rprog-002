pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

	len = 0
	me_id = 0
        
	for (i in 1:length(id)) {
		
		# First get the correct filenames
		if (id[i] %/% 100 != 0){
			filename <- paste(as.character(id[i]), '.csv', sep='')
		}
		else if (id[i] %/% 10 != 0){
			filename <- paste('0', as.character(id[i]), '.csv', sep = '')
		}
		else{
			filename <- paste('00', as.character(id[i]), '.csv', sep = '')
		}


		filename <- paste(directory, '/', filename, sep = '')
		
		data = read.csv(filename)
		cdata = data[complete.cases(data[[pollutant]]),]
		if (nrow(cdata) > 0){
			len = len + nrow(cdata)
			me_id = me_id + nrow(cdata)*mean(cdata[[pollutant]])
		}
	}

	round(me_id/len, digit=3)

}
