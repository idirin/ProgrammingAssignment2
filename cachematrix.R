## Put comments here that give an overall description of what your
## functions do
## This functions will allow caching a matrix and it's inverse.The matrix needs to be square. By caching these objects
## you avoid solving the inverse of the matrix one time and another. The functions take advantage of scoping using the
## operator <<- which assign values to variables out of the scope of the fuction where they are used.

## Write a short comment describing this function
##  Function makeCacheMatrix
##    IN @Matrix Although this memory accept non square matrix, it will need it to be square to calcultate it's inverse
##    OUT @list_of_functions 
##  This function will encapsule the access, to a Matrix and its inverse. These two objects would be accesed using 
##  setters and getters. They will be cached in memory so it's not necesary creating and calculating (the inverse) 
##  them every time we need them. 
##  The function used <<- operator which assign the objects to variables out of the scope of the function makeCacheMamtrix 
##  The matrix will be storage in the variable X while it's inverse will be storage in the variable m
##  Setters assign the value using <<- operator while getters just return the variables x (get) m (getinversa)

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL 
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinversa <- function(inversa) m <<- inversa
  getinversa <- function() m
  list(set = set, get = get,
       setinversa = setinversa,
       getinversa = getinversa)
}


## Write a short comment describing this function
##  Function cacheSolve
##    IN @Matrix Special Matrix creaated with makeCacheMAtrix function
##    OUT @InverseMatrix a The inverse of the matrix cached
##  If it's the first time that we try to calculate the inverse of the matrix it will be calculated with solve (function
##  that calculates the matrix of a square matrix) if the matrix Cached is not square (mxm) it would rise an error
##  The inverse will be cached using setInversa thus we won't need to calculate it again in the future  
##  If the inverse was already calculated, the function will return the cached inverse matrix using getInversa


cacheSolve <- function(x, ...) {
  
  m <- x$getinversa()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinversa(m)
  m
  
        ## Return a matrix that is the inverse of 'x'
}
