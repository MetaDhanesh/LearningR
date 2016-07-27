x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20 ,1), d = rnorm(100, 5))
lapply(x, mean)

# runif generates uniform random variable
# its 1st arg is: no. of uniform rv that you want
# to generate
# so, if we pass, one, it generates 1 uniform rv and returns
# Here, we are applying runif function on sequence 1:4
x <- 1:4
lapply(x, runif)

# runif has other args as well 
# they have default values, like min = 0 and max = 1
# To pass values for those args, we can pass their values
# in lapply ... args list. They should be named
x <- 1:4
lapply(x, runif, min = 0, max = 10)

# lapply and friend functions use anonymous functions
# heavily
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
# An anon function to extract first col of matrix
lapply(x, function(elt) elt[,1])

# sapply - simplifies lapply if possible

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20 ,1), d = rnorm(100, 5))
# Returns list with each ele of length 1
lapply(x, mean)

# Returns a vector
sapply(x, mean)

# mean is not meant to be applied on a list
# the below code would return error
mean(x)

str(apply)

# apply - loop function

# x is a matrix with 20 rows and 10 cols
# i.e. dimension 1 has 20 rows and dimension 2 has 10 columns
x <- matrix(rnorm(200), 20, 10)

# keep the second dimension as is and collapse 
# the first dimension which is the rows
apply(x, 2, mean)

# Similarly, we can keep the first dimension as is
# and apply function on other dimensions
apply(x, 1, sum)

#in-build function that works similarly as previous apply func
rowSums(x) 

#Quantiles of row of a matrix with 25 and 75 percentile
x
apply(x, 1, quantile, probs = c(0.25, 0.75))

# Average matrix in an array
a <- array(rnorm(2 * 2 * 10), c(2,2,10))
apply(a, c(1,2), mean)
# it's equivalent rowMeans function call
rowMeans(a, dims = 2)


# mapply
str(mapply)

mapply

list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))

# It's equivalent mapply
mapply(rep, 1:4, 4:1)

#Vectorizing a function

noise <- function(n, mean, sd){
    rnorm(n, mean, sd)
}

noise(5, 1, 2)

#Incorrect value returned when calling the func on vector
noise(1:5, 1:5, 2)

# We get correct result using mapply
mapply(noise, 1:5, 1:5, 2)

#This is same as 
list(noise(1, 1, 2), noise(2, 2, 2), noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))


# tapply

x <-c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
f
tapply(x, f, mean)

# Take group mean without simplification
tapply(x, f, mean, simplify = FALSE)

#finfing group ranges
tapply(x, f, range)

# split function
split(x, f)

# common idiom

lapply(split(x, f), mean)

# uses of split
library(datasets)

# splitting dataframe airquality based on month
s <- split(airquality, airquality$Month)

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

#fixing missing values 
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

# gl
?gl
gl(2,2,20)
gl(2,1,20)


# splitting on more than one levels

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5,2)

f1
f2

interaction(f1, f2)

# Interactions can generate empty levels
str(split(x, list(f1, f2)))

# We can drop empty levels
str(split(x, list(f1, f2), drop = TRUE))