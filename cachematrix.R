## Instead of repeatedly performing a computation that may take a lot of time,
## such as matrix inversion, it would may be beneficial to cache the inverse of
## a matrix for future use. Below there are two functions used to create an object
## that stores a matrix and caches the inverse.

## The first function creates the object that can cache the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInv <- function(inverse) inv <<- inverse
  getInv <- function() inv
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## The second function computes the inverse of the original matrix created by
## the first function, makeCacheMatrix. If the inverse has already been
## calculated and it is not a new matrix, then the value of the inverse is 
## retrieved from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getInv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(mat, ...)
  x$setInv(inv)
  inv
  
}