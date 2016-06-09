## Programming Assignment 2 for R Programming on Coursera
## Assignment: Lexical Scoping
## Learner: Mizan Chowdhury
## 
## I commented out the below 2 functions that I cloned from GitHub Repository.
## Function no. 1
## makeCacheMatrix <- function(x = matrix()) {
##
##  }
## Function no. 2
## cacheSolve <- function(x, ...) {
##  }

## The first function below creates a special "matrix" object that can cache its inverse
##
makeCacheMatrix <- function(x = numeric()) {
  
  # starts with a NULL value in cache
  cache <- NULL
  
  # store a matrix
  setMatrix <- function(newValue) {
    
    x <<- newValue
    # since the matrix is assigned a new value, flush the cache
    cache <<- NULL
    
  }
  
  # returns the stored matrix
  getMatrix <- function() {
    x
  }
  
  # cache the given argument 
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  # get the cached value
  getInverse <- function() {
    cache
  }
  
  # returns a list of functions
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)      
  
}

## The second function below computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##
cacheSolve <- function(y, ...) {
  # to return a matrix that is the inverse of 'x'
  # get the cached value
  inverse <- y$getInverse()
  # if a cached value exists return it
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # otherwise get the matrix, caclulate the inverse and store it in the cache
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  # return the inverse
  inverse
}
