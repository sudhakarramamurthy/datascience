1. Create a Inversable Matrix as shown below
> r1 <- c (4 ,7)
> r2 <- c( 2, 6)
> mat <- rbind(r1,r2)
> mat
   [,1] [,2]
r1    4    7
r2    2    6

2. Create makeCacheMatrix passing the inversable matrix created in step 1
> myHugeMatrix <- makeCacheMatrix(mat)

3. Call cacheSolve passing the makeCacheMatrix created in step 2
> cacheSolve(myHugeMatrix)
       r1   r2
[1,]  0.6 -0.7
[2,] -0.2  0.4

4. Call again the same function, you can see a trace printing the data being read from cache

> cacheSolve(myHugeMatrix)
getting cached data
       r1   r2
[1,]  0.6 -0.7
[2,] -0.2  0.4