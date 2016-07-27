calcCorr <- function(file, threshold){
    
    Data.frame <- read.csv(file)
    good <- complete.cases(Data.frame)
    count <- sum(good)
    
    if (count <= threshold)
        return()
    
    monitor_frame <- subset(Data.frame, good)
    
    headers <- names(monitor_frame)
    
    sulfate_vec <- subset(monitor_frame, select = headers[2])
    nitrate_vec <- subset(monitor_frame, select = headers[3])
    
    cor(sulfate_vec, nitrate_vec)
}


corr <- function(directory, threshold = 0){
    
    lists_files <- list.files(path = directory, full.names = TRUE)
    
    corr_vec <- vector(mode = "numeric", length = 0)
    
    for(i in seq_along(lists_files)){
        
        corr_vec <- c(corr_vec, calcCorr(lists_files[i], threshold))
    }
    
    corr_vec
}


