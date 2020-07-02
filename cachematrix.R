## function makecachematrix operates to store a matrix in a cache to be 

## to be called upon later by cachesolve which returns the inverse of the matrix

## Stores a given matrix 

makecachematrix<- function(x=matrix(),...){
inv<- NULL
set=function(y){
x<<-y
inv<<-NULL}
get<-function()x
setinv<-function(inverse)inv<<-inverse
getinv<- function() inv
list(inv = inv,get = get,setinv = setinv, getinv = getinv)
}


## gives inverse of matrix stored in makecachematrix

cachesolve<-function(x=matrix(),...){
inv<-x$getinv()
if(!is.null(inv)){print("getting data")
return(inv)
}
dat<-x$get() 
if(det(dat)!=0){
inv<-solve(dat,...)
x$setinv(inv)
return(inv)
}
if(det(dat)==0){
message("inverse doesn't exist") 
}
}
