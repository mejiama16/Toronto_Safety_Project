#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto.
# Author: Mariana Garcia Mejia
# Date: 07 May 2026
# Contact: mariana.garcia@mail.utoronto.ca
# License: MIT
# Pre-requisites: Packages `tidyverse` and `opendatatoronto` must be installed.

library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("bda840b6-4ae1-43db-b544-0c518ddf9df3")
package

# get all resources for this package
resources <- list_package_resources("bda840b6-4ae1-43db-b544-0c518ddf9df3")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
write_csv(data, "data/01-raw_data/additional_data.csv") 
