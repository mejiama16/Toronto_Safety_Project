#### Preamble ####
# Purpose: Simulates a dataset of homicides in the city of Toronto in 2025. 
  #Includes police division area, type of homicide and date.
  #Note that we only simulate data for one year for simplicity.
# Author: Mariana Garcia Mejia
# Date: 07 May 2026
# Contact: mariana.garcia@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(2006)


#### Simulate data ####
# Division
divisions <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", "D33",
              "D41", "D42", "D43", "D51", "D52", "D53", "D54", "D55")

# Homicide types
hom_type <- c("Shooting", "Stabbing", "Other")

# Months of the year
months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# Create a dataset by creating homicide events. There were 45 homicides in 2025.
# We make several assumption for the purpose of simplicity:
#   1. Assume all months have 30 days.
#   2. Assume homicides occur uniformly across months (with the same probability).
#   3. Assume homicides occur uniformly across Police Divisions.

analysis_data <- tibble(
  DAY = sample(1:30, 
               size = 45,
               replace = TRUE),
  MONTH = sample(
    months,
    size = 45,
    replace = TRUE
  ),
  DIVISION = sample(
    divisions,
    size = 45,
    replace = TRUE
  ),
  HOMICIDE_TYPE = sample(
    hom_type,
    size = 45,
    replace = TRUE,
    prob = c(0.60, 0.30, 0.1) # Rough homicide type distribution
  )
)

#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
