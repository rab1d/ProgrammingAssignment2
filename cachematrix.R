## Mohammod Arafat
## Coursera-JHU Data Science // R Programming // Programming Assignment 2 

## The following functions allows you to cache the solving the inverse of matrices potentially saving you computational time

## The following function creates a "special" vector which is actually a list of 4 functions:
## 1. set <- allows you to set the matrix
## 2. get <- allows you retrieve the matrix
## 3. setInverse <- allows you to set the inverse of the matrix
## 4. getInverse <- allows you to retrieve the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  matrixInverse <- NULL
  
  set <- function(y) {
    x <<- y
    matrixInverse <<- NULL
  }
  
  get <- function() x
  
  getInverse <- function() matrixInverse
  setInverse <- function(mi) matrixInverse <<- mi
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mi <- x$getInverse()
  if(!is.null(mi)) {
    message("getting cached data")
    return(mi)
  }
  data <- x$get()
  mi <- solve(data, ...)
  x$setInverse(mi)
  mi
}
