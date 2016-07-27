
completeCases <- function(file){
    
    monitorData.frame <- read.csv(file)
    headers <- names(monitorData.frame)
    
    data1 <- subset(monitorData.frame, select = headers[2])
    data2 <- subset(monitorData.frame, select = headers[3])
    
    good <- complete.cases(data1, data2)
}

complete <- function(directory, id = 1:332){
    
    lists_files <- list.files(path = directory, pattern = "*.csv")
    filesOfInterest <- lists_files[id]
    complete_frame <-data.frame(id = numeric(0), nobs = numeric(0))
    
    for (i in seq_along(filesOfInterest)) {
        
        fileWithPath <- paste(getwd(), "/", directory,"/", filesOfInterest[i], sep = "")
        complete_frame[i, ] <- list(id[i], sum(completeCases(fileWithPath)))
    }
    
    return(complete_frame)
}
