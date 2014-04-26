## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# in R the function solve(X) returns the inverse of the matrix
#The function MakecaheMatrix take as an argument a matrix and:
#1)through the function "set" it initializes the variable m to zero and store the inputed matrix to a variable x
#2)through the function "get" return the initial variable x (it does not return the inversed matrix, just the original matrix)
#3)through its function "setinverse", it computes the inverse of the inputed matrix and store it in the variable m
#4)through its function "getinverse" , it returns the value of the variable m that contains the inversed matrix computed at step 3
# 

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
             getinverse = getinvers)
}


## Write a short comment describing this function

#The function cacheSolve take as an argument a matrix of the type created by the function makeMatrix above(a normal R matrix
#wont work with it)and:
#1)When the matrix is entered the function get the value of the stored inversed matrix via the function "getinverse"
# and store it into a local variable m.
#2) It test if the element m is non empty (function !is.null()). 
# If m is non empty it means that the inverse of the Matrix has been computed before, in this case it just take that
# inverse print a message "getting a cached matrix" and return the value of previously cached matrix.
#3) In case the value of m is empty it means that the inverse has never been calculated before.
# So the program computes.
#4) To computes the Inverse, the program access the initial value of the matrix via the methode "get"
# and assign it to the local variable data.
#5) it computes the value of inverse using the function Solve(data)
#6) the program sets the value of the inversed matrix into the cache, via the function "set inverse", so that the inverse
# won't be computed again in the future. 
#7) the program return the inversed matrix 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		  m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached Matrix")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
