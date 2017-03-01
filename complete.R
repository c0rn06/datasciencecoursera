complete <- function(directory, id = 1:332) {
  
  # create empty master data frame to store all values 
  master_frame <- data.frame()

  
  #create a list of all of the file names in the directory
  location_files <- list.files(directory, full.names = TRUE)
  
  #step through each location, delete NA rows, count number of rows left
  for(i in id){
    #get the location data frame
    location <- read.csv(location_files[i])
    
    nobs <- sum(complete.cases(location))
    
    
    temp_frame <- data.frame(i, nobs)
    #colnames(temp_frame) <- c("id", "nobs")
    
    #add/bind it to the master frame
    master_frame <- rbind(master_frame, temp_frame)
  }
  colnames(master_frame) <- c("id", "nobs")
  return(master_frame)
  
}
