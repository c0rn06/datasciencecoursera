pollutantmean <- function(directory, pollutant, id = 1:332){
  
 # create empty master data frame to store all values 
  master_frame <- data.frame()
  
  #create a list of all of the file names in the directory
  location_files <- list.files(directory, full.names = TRUE)
  
  #step through each location and add it to the master data frame
  for(i in id){
    #get the location data frame
    location <- read.csv(location_files[i])
    
    #add/bind it to the master frame
    master_frame <- rbind(master_frame, location)
  }
  
  #get the mean of all rows, pollutant column in master data frame
  m <- mean(master_frame[,pollutant],na.rm = TRUE)
  
  print(m)
  
}