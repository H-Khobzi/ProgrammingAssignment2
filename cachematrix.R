## By using these two functions below you are able to inverse a given matrix
## using a cache to make computation more proper.In order to use these functions
## you should put a given matrix in first function and assign it to a variable
## and then use this variable as a input for second function. 

## This first function, creates a special "matrix", which is really a list 
##containing a function to
## 1- set the value of the matrix
## 2- get the value of the matrix
## 3- set the value of the inverted matrix
## 4- get the value of the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <-function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setMatrix <- function(solve) m <<- solve
        getMatrix <- function() m
        list(set=set, get=get, setMatrix=setMatrix, getMatrix=getMatrix)
}


## The following function calculates the inverse of the special "matrix" created
##with the above function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getMatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setMatrix(m)
        m
}
