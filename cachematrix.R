## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The function sets and gets the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## the function calculates the inverse of the matrix created above.
## checks to see if inverse is empty and if not uses cached inverse

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

#to test you do like this:
#>mat1 = matrix(r, nrow=10, ncol=10)
#>x = makeCacheMatrix(mat1)
#>cacheSolve(x)
#and you get the answer very fast! Repeat to see message
#or read in matrix like this:
#temp= read.csv("testfile.csv")
#temp1 <- as.matrix(temp)
#x = makeCacheMatrix(temp1)
#...etc. but don't forget R assumes header and
#it will complain matrix not square if u forget!!!
