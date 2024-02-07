## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL

  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }

  getMatrix <- function() x

  setCache <- function(inverseMatrix) {
    cache <<- inverseMatrix
  }

  getCache <- function() cache

  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setCache = setCache, getCache = getCache)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {  
  cache_key <- digest(x)
  if(exists(cache_key, envir = globalenv())) {
    print("Retreiving the inverse of the matrix from the cache memory")
    return(get(cache_key, envir = globalenv()))
  } else {
    result <- solve(x)
    assign(cache_key, result, envir = globalenv())
    print("Returing the inversion of the matrix for the first time and storing the result in cache memory")
  }
  return(result)
  
  }
