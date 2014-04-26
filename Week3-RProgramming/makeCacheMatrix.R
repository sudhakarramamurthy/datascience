makeCacheMatrix <- function(x) { 
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() { x}

  setInverse <- function(iMat) {
    inverse <<- iMat
  }
  getInverse <- function() inverse
  list(set = set, get = get, getInverse= getInverse, setInverse = setInverse)
}
