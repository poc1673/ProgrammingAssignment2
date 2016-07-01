# Notes to self:
# The original example provided on the website fulfills two different functions:
#   (1)  It takes a vector of numbers and caches them in their own environment.  This pulls them out of memory but makes
#        them a little bit less accessible.
#   (2)  To access this cached data and get the mean, a second function is used which checks to see if the mean has already
#        been calculated in the provided environment.  If not, it then calculates it and sets the mean.



# I need to make two functions under a similar framework:
  # (1)  A function which caches the inverse of a matrix in a seperate environment.
  # (2)  A function which can check for this inverse and pull it for when it is necessary.



## Put comments here that give an overall description of what your
## functions do

# Write a short comment describing this function
# This function will go through similar steps to the makeVector function by getting and setting the matrix, and then setting and getting the 
# inverse of the matrix.  For the sake of simplicity I will just use the same framework that was used in the example provided in the course.

makeVector <- function(x = numeric()) {

}


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solved) m <<- solved
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


# This will be the function that actually accesses the environment in the function above and checks to see if the inverse has been calculated yet.
# If it has, then it will return it.  If not, it will solve for it. Again, the framework from the original example was reused.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  
}
#   An example of the output of the funtions above.  It can be confirmed by running solve(mat) that the output of everything below is correct
#  and that it matches the formatting that was specified at the beginning of the assignment.

mat<-matrix(c(1,0,0,0,1,0,0,0,1),3,3)*5
hold<-makeCacheMatrix(mat)
cacheSolve(hold)
