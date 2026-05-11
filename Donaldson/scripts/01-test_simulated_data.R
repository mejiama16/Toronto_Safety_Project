#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Toronto 
  #homicides in 2025.
# Author: Mariana Garcia Mejia
# Date: 08 May 2026
# Contact: mariana.garcia@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

## Data set structure
# Check if the dataset has 45 rows
if (nrow(analysis_data) == 45) {
  message("Test Passed: The dataset has 45 rows.")
} else {
  stop("Test Failed: The dataset does not have 45 rows.")
}

# Check if the dataset has 4 columns
if (ncol(analysis_data) == 4) {
  message("Test Passed: The dataset has 4 columns.")
} else {
  stop("Test Failed: The dataset does not have 4 columns.")
}

## Check validity of data in each column

# Check if the 'DAY' columns contains only values between 1 and 30.
valid_days <- c(1:30)

if (all(analysis_data$DAY %in% valid_days)) {
  message("Test Passed: The 'DAY' column contains only valid days.")
} else {
  stop("Test Failed: The 'DAY' column contains invalid days.")
}

# Check if the 'MONTH' column contains only valid months
valid_months <- c("January", "February", "March", "April", "May", "June",
                   "July", "August", "September", "October", "November", 
                   "December")

if (all(analysis_data$MONTH %in% valid_months)) {
  message("Test Passed: The 'MONTH' column contains only valid months.")
} else {
  stop("Test Failed: The 'MONTHS' column contains invalid months.")
}

# Check if the 'DIVISION' column contains only valid divisions.
valid_divisions <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", 
                     "D33","D41", "D42", "D43", "D51", "D52", "D53", "D54", 
                     "D55")

if (all(analysis_data$DIVISION %in% valid_divisions)) {
  message("Test Passed: The 'DIVISION' column contains only valid divisions.")
} else {
  stop("Test Failed: The 'DIVISION' column contains invalid divisions")
}

# Check if the 'HOMICIDE_TYPE' column contains only valid homicide types.
valid_hom_types <- c("Shooting", "Stabbing", "Other")

if (all(analysis_data$HOMICIDE_TYPE %in% valid_hom_types)) {
  message("Test Passed: The 'HOMICIDE_TYPE' column contains only valid homicide types.")
} else {
  stop("Test Failed: The 'HOMICIDE_TYPE' column contains invalid homicide types.")
}

## Final Tests
# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'HOMICIDE_TYPE', 'MONTH', and 'DIVISION' columns
if (all(analysis_data$DIVISION != "" & analysis_data$HOMICIDE_TYPE != "" & analysis_data$MONTH != "")) {
  message("Test Passed: There are no empty strings in 'DIVISION', 'HOMICIDE_TYPE', or 'MONTH'.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}