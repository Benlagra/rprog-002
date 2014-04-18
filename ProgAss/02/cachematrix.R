## 
##  The code defines two functions used to cache a matrix and its inverse. 
##  The first function creates an extended 'matrix' object which retains the information about 
##  the matrix and its inverse. The second fonctions, whose argument is the extended object,
##   is a cached version of the function Solve. It returns the cached or computed value for the inverse
##   matrix.
##  




## This function creates an extended 'Matrix' object in the form of a list of functions which
## keep the information about the matrix argument x and its inverse.
## Set(y) resets the matrix x to be inverted to the value y and its inverse to NULL.
## get() returns the cached matrix x.
## getinverse() returns the cached inverse matrix or NULL if the former was not already computed.
## setinverse(invserse) sets the new value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
       
       m <- NULL
       set <- function(y) {
              x <<- y
              m <<- NULL
       }
       get <- function() x
       setinverse <- function(inverse) m <<- inverse
       getinverse <- function() m
       list(set = set, get = get,
            setinverse = setinverse,
            getinverse = getinverse)

}


## This functions is an extension to the base function Solve. It calculates the inverse of a matrix
## only if this has not already be done earlier. It acts on the extended object defined in the first
## function and sets the value of the inverse matrix in that object if this was not done before.

cacheSolve <- function(x, ...) {
        
       
       ix <- x$getinverse()
       if(!is.null(ix)) {
              message("Inverse already calculated ! \n Getting cached data")
              return(m)
       }
       data <- x$get()
       ix <- solve(data)
       x$setinverse(ix)
       ix
}
