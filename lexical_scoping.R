#Josh Stolz


#NAME MASKING
# If the variable is not defined in the function R looks one level up.
a <- 10
b <- function()
{
  c <- 11
  c(a, c)
}
b()

#FUNCTIONS VS. VARIABLES
#The same principles apply regardless of the type of associated value — finding functions works exactly the same way as finding variables:
a <- function(x) 10 * x
b <- function(){
  a <- function(x) x + 10
  a(12)
}
b()
#[1] 22

#A FRESH START
#Each new run of a function is independent of the last and the environment is created new.
a <- function(){
  if(!exists("z"))
  {
    z <- 10
  }
  else
  {
    z <- z+10
  }
  z
}
a()


#DYNAMIC LOOKUP
#Lexical scoping controls where to look for values not when to look for them. R looks for the values when the function is executed not when it is created. The #output of the function can be different depending on objects outside its environment.

g <- function() x^3
x <- 10
g()
#[1] 1000

### Predict the output without running the code

#1
d <- 20
b <- function()
{
  c <- 11
  c(c, d)
}
b()

#2
d <- 20
b <- function()
{
  c <- 11
  d <- 25
  c(c, d)
}
b()

#3
a <- function(x) 3 * x
b <- function(){
  a <- function(x) x + 8
  a(12)
}
b()


#Caching a variable is a way of using scoping rules to store variables in an environment that might take a long time to compute.
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

mvec <- makeVector()
x <- 1:4
mvec$set(x)
mvec$get()
#[1] 1 2 3 4
 mvec$getmean()
#> NULL
 mvec$setmean(3.4)
 mvec$getmean()
#> 3.4

cachemean(mvec)


#### inverting a matrix is a common process that takes a lot of computation
#### using the script above and the skeleton below make a function that will cache an inverted square matrix
### solve() inverts a square matrix.
a=c(1,2,3)
b=c(3,2,1)
c=c(2,1,3)
dataset=matrix(cbind(a,b,c),nrow=3,ncol=3)

makeCacheMatrix <- function(x = matrix()) {

    }

cacheSolve <- function(x, ...) {

}


## https://www.coursera.org/learn/r-programming/home/welcome
## https://www.geeksforgeeks.org/lexical-scoping-in-r-programming/
