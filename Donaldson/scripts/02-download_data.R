#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Mariana Garcia Mejia
# Date: 07 May 2026
# Contact: mariana.garcia@mail.utoronto.ca
# License: MIT
# Pre-requisites: Packages `tidyverse` and `opendatatoronto` must be installed.


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# get package
package <- show_package("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")
package

# get all resources for this package
resources <- list_package_resources("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(data, "data/01-raw_data/raw_data.csv") 
         
