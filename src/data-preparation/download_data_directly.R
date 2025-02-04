### Downloading the listings.csv and calendar.csv files from InsideAirbnb, decompressing included ###

# If the script is run just in R, you have to set a working directory with setwd()
library(dplyr)

# Downloading the listings.csv file
download_listings <- function(url, filename, filepath){
  dir.create(filepath)
  download.file(url = url, destfile = paste0(filepath,filename, ".csv.gz"))
  read_csv("data/listings.csv.gz") %>% write_csv("data/listings.csv")
}

url_listings <- "http://data.insideairbnb.com/united-states/ny/new-york-city/2021-08-04/data/listings.csv.gz"

download_listings(url_listings, "listings", 'data/') 
# The directory name is not the absolute name, because this way the code remains portable to other computers/working environments as well. 
# A new folder called 'data' is created in the working directory and the file is saved there.

# Downloading the calendar.csv file
download_calendar <- function(url, filename, filepath){
  download.file(url = url, destfile = paste0(filepath,filename, ".csv.gz"))
  read_csv("data/calendar.csv.gz") %>% write_csv("data/calendar.csv")
}

url_calendar <- "http://data.insideairbnb.com/united-states/ny/new-york-city/2021-08-04/data/calendar.csv.gz"

download_calendar(url_calendar, "calendar", 'data/') 

# Opening the listings.csv file
library(readr)
listings <- read.csv("data/listings.csv")
View(listings)
