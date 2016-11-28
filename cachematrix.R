## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix creates a special matrix, which is the list containing
## a function to set the value of matrix, get the value of matrix,
## set the value of inverse and get the value of inverse

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y) {
x <<- y
i <<- NULL
}
get <- function() x
setinverse <- function(solve) i <<- solve
getinverse <- function() i
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}


## Write a short comment describing this function
## Function calculates inverse of the matrix created with above function
## Function first checks if the inverse is already calculated. If so, the
## function skips the computation and gets the inverse from cache.
## Otherwise, it calculates inverse of the matrix and sets the value of 
## the inverse in the cache via the setinverse function

cacheSolve <- function(x, ...) {
i <- x$getinverse()
if(!is.null(i)) {
message("getting cached data")
return(i)
}
data <- x$get()
i <- solve(data, ...)
x$setinverse(i)
i
}

