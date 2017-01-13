## Matrix inversion is usually a costly computation 
# and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly 
# So the following pair of functions will cache the matrix and its inverse (if already computed), 
# and allow to spare the costly re-computation.


## The next function creates a special "matrix" object that can cache its inverse. It contains a list of function to
#       set the value of the matrix
#       get the value of the matrix
#       set the value of the inverse
#       get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function (inverse) i <<- inverse
  getinverse <- function () i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.
# If the inverse has not been calculated, then the function will calculate it and use set method to set inverse in the cached version

cacheSolve <- function(x, ...) {
  # get cached inverse
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached inverse")
    return(m)
  }
  # get cached matrix 
  cm <- x$get()
  message("Calculating inverse")
  i <- solve(cm, ...)
  message("Setting inverse")
  x$setinverse(i)
  i
}
          
