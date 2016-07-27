computeMean <- function(file, pollutant){
    
    monitorData.frame <- read.csv(file)
    data <- subset(monitorData.frame, select = pollutant)
    bad <- is.na(data)
    pollutantData <- data[!bad]
    newrow <- list(sum(pollutantData), length(pollutantData))
    
    return(newrow)
}


pollutantmean <- function(directory, pollutant, id = 1:332){
    
    lists_files <- list.files(path = directory, pattern = "*.csv")
    filesOfInterest <- lists_files[id]
    mean_frame <-data.frame(particulates = numeric(0), checks = numeric(0))
    
    for (i in seq_along(filesOfInterest)) {
        
        fileWithPath <- paste(getwd(), "/", directory,"/", filesOfInterest[i], sep = "")
        mean_frame[i, ] <- computeMean(fileWithPath, pollutant)
    }
    
    
    totalParticulates <- sum(mean_frame[,1])
    totalChecks <- sum(mean_frame[,2])
    
    totalParticulates / totalChecks
}
