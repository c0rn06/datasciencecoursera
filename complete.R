complete <- function(directory, pollutant, id = 1:332){
  
  # create empty master data frame to store all values 
  master_frame <- data.frame(1,2)
  colnames(master_frame) <- c("id", "nobs")
  
  #create a list of all of the file names in the directory
  location_files <- list.files(directory, full.names = TRUE)
  
  #step through each location, delete NA rows, count number of rows left
  for(i in id){
    #get the location data frame
    location <- read.csv(location_files[i])
    
    goodrows <- nrow(complete.cases(location))
    temp_frame <- data.frame(1,2)
    colnames(temp_frame) <- c("id", "nobs")
    temp_frame[1,1]<-i
    temp_frame[1,2]<-goodrows
    
    
    #add/bind it to the master frame
    master_frame <- rbind(master_frame, temp_frame)
  }
  
  print(master_frame)
  
}