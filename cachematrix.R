## makeCacheMatrix and cacheSolve functions are build with motto 
## "compute once, use multiple times" 
## Computing inverse of a matrix is a computation heavy
## operation. Also, if inverse of same matrix is being at
## different stages of operation, it is advisable to compute
## and keep the inverse of matrix only once


## This function takes as argument, a matrix, if no matrix is
## passed, it creates an empty matrix

makeCacheMatrix <- function(x = matrix()) {
    
    mat_inv <- NULL
    
    ## Sets value of matrix x as y matrix
    ## which is passed as argument
    ## also, set the mat_inv value to NULL
    ## as matrix inverse is not calculated
    setMatrix <- function(y){
        x <<- y
        mat_inv <<- NULL
    }
    
    ## Returns the matrix x 
    getMatrix <- function() x
    
    ## sets the mat_inv element to inverse value
    setInverse <- function(inverse) mat_inv <<- inverse
    
    ## returns the matrix inverse value stored in mat_inv
    getInverse <- function() mat_inv
    
    ## returns a special matrix
    ## which is actually a list of functions
    list(setMatrix = setMatrix, getMatrix = getMatrix, 
         setInverse = setInverse, getInverse = getInverse)
}


## This function takes as input, the special matrix created 
## by the makeCacheMatrix function
## if inverse of matrix value is set NULL, 
## it calculates the inverse and sets the mat_inv value
## by calling the function setInverse() of list x
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    inv <- x$getInverse()
    
    if(!is.null(inv)){
        print("Retrieving from cache")
        
        ## retrieving matrix inverse from cache
        return(inv)
    }
    
    ## matrix inverse is not calculated, so calculate
    ## matrix inverse by calling solve function on matrix x
    data <- x$getMatrix()
    inv <- solve(data, ...)
    x$setInverse(inv)
    
    ## return the matrix inv
    inv
}
