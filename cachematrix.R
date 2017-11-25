## The purpose of this function is to cache the inverse of a matrix

## 1 - set the value of the vector
## 2 - get the value of the vector
## 3 - set the value of the mean
## 4 - get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
   i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
list(set = set, get = get, setinv = setinv, getinv = getinv)
}


##  computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    i<- x$getinv()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i<- solve(data, ...)
    x$setinv(i)
	i
}
