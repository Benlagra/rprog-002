complete <- function(directory, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
	
	len = length(id)

	cases = integer(len)	 
        
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


		if (!file.exists(filename)){
		}
		else{
		print('The file can not be found')
		} 
		filename <- paste(directory, '/', filename, sep = '')
		
		data = read.csv(filename)
		cases[i] = sum(complete.cases(data))
	}

	data = data.frame(id, cases)

	data

}
