## pretty intrusive, heavy lifting memoization
## client  code needs to know about the memoization, and needs to explicitly check if  
## the result's been cached

## create cache object to set/get a matrix and its inverse
## note OO-like set/get list returning accessors 
makeCacheMatrix <- function(x = matrix()) {
  invM <- NULL
  set <- function(y) {
    x <<- y
    invM <<- NULL
  }
  get <- function() x
  setinverse <- function(i) invM <<- i
  getinverse <- function() invM
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## uses cache object to get the cached inverse if it's there,
## otherwise solves the inverse and caches it

cacheSolve <- function(x, ...) {
        invM <- x$getinverse()
        if (!is.null(invM)){
          message("getting inverse from cache")
          return(invM)
        }
        mat <- x$get()
        i <- solve(mat) # we're assured this will work       
        message("adding inverse to cache")
        x$setinverse(i)
        i
}
