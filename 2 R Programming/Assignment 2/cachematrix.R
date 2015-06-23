## R Programming - Assignment 2
##
## makeCacheMatrix and cacheSolve allow to create a matrix that can store its
## inverse, and either access its inverse value or compute and save it if it was
## still no computed

## makeCacheMatrix creates a matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    # Stores the inverse, or stores NULL if the inverse is not yet known
    inverse <- NULL
  
    # Set a new matrix 'y' and delete the previous inverse
    set <- function(y) {
        x <<- y           # set matrix
        inverse <<- NULL  # delete previous inverse
    }
  
    # Get the stored matrix
    get <- function() x
  
    # Set the inverse 'inv'
    setInverse <- function(inv) {
        # Print a message if an inverse matrix was already there
        if (!is.null(inverse)) {
            message("overwriting a previously stored inverse matrix")
        }
        
        # Store the inverse
        inverse <<- inv
    }
  
    # Get the inverse
    getInverse <- function() inverse
  
    # Return the object
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve returns the stored inverse of the matrix object 'x' returned by
## makeCacheMatrix, or computes (and saves) it if it is not yet known

cacheSolve <- function(x, ...) {
    # Get the inverse
    inverse <- x$getInverse()
  
    # If NULL (not known), compute and store it for future calls
    if (is.null(inverse)) {
        matrix <- x$get()         # get matrix
        inverse <- solve(matrix, ...)  # compute its inverse
        x$setInverse(inverse)     # store it
    }
  
    # Return the inverse
    inverse
}
