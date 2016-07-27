#Reading the data
#If you use read.csv with na.strings=“Not Available” 
#and stringsAsFactors=FALSE you shouldn’t need to 
#convert any columns to numeric or character. 
#Plus, your sorts will work as expected.

#Getting File Paths into a vector

#USing directory and id
#Method 1 : list.files  and take a subset from id
list.files(directory, full.names=TRUE)[id]

#Method 2 : Using paste and formatC
paste(directory, "/", formatC(id, width=3, flag="0"), ".csv", sep="")

#Method 3 : Using sprintf
sprintf("%s/%03d.csv", directory, id)

##Loops and Indices

# loop over an integer vector and build another vector
#If the first vector is not 1 based like 1:10, 
#Then we end up with missing values

v1 <- c(4,5,6)
v2 <- numeric()
for(idx in v1)
    v2[idx] <- idx

v2 ##Results in
## [1] NA NA NA  4  5  6


#Solution
v2 <- numeric()
idx <- 1
for(value in v1) {
    v2[idx] <-value
    
    idx <- idx + 1
}

v2
#Results in
## [1] 4 5 6

#Using above approach to build temp vectors and 
#creating DF later

X <- Y <- numeric()
idx <- 1
for(value in v1) {
    X[idx] <- value
    Y[idx] <- value^2
    
    idx <- idx + 1
}

DF <- data.frame(X, Y, row.names=LETTERS[X])
DF

#Using an Index that Doesn’t Exist
# report NA on a column when a row doesn’t exist
#When an index is greater than the number of rows then R returns NA

data.frame(X=15, Y=DF$Y[10])

#Be careful of negative indices
DF[-1,]

#Don’t Call complete() in corr()
#you wind up reading every file twice

#get the number of complete cases is read the file 
#and run sum() on complete.cases().

#you can loop through the files 
#and if complete cases > threshold then calculate cor() and add it to a vector

DF <- read.csv(files[1])

sum(complete.cases(DF))


#Return and Print
#Dont have to return or print
#Unless you're prematurely exiting a function

my_func <- function(my_value) {
    if(my_value > 10) {
        ## do some other processing
        return(my_value)
    }
    sqrt(my_value)
}

my_func(40)

my_func(9)



getwd()

dir.create("Week2Assignment")

dir()

setwd("Week2Assignment")
getwd()

ls()

dir.create("rprog_data")

unzip("rprog_data_specdata.zip", exdir = "rprog_data")

lists_files <- list.files(path = "specdata", pattern = "*.csv")
regexp <- "([[:digit:]]{3}).([[:alpha:]]+)"
lists_files

fileNumberArr <- as.integer(substr(lists_files, 1,3))
fileNumberArr
fileNumData.Frame <- data.frame(fileNumber = as.integer(substr(lists_files, 1,3)), fileNumChar = as.character(substr(lists_files, 1,3)))
length(fileNumberArr)
as.character(fileNumberArr, width = 3)

my_data <- read.csv(file = paste(getwd(),"/", "specdata","/", lists_files[1], sep = ""))
pollutant <- "sulfate"

interest <- subset(my_data, select = pollutant)
class(interest)

bad <- is.na(interest)
pollutantData <- interest[!bad]

class(pollutantData)

pollutantData

length(pollutantData)

newrow <- as.list(c(sum(pollutantData), length(pollutantData)))

newrow

class(names(my_data))