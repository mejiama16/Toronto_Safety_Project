#### Preamble ####
# Purpose: Tests that the analysis data contains 
# Author: Mariana Garcia Mejia
# Date: 14 May 2026
# Contact: mariana.garcia@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Test that the dataset has 669 rows (number of reported homicides 2011-2020).
test_that("dataset has 669 rows", {
  expect_equal(nrow(data), 669)
})

# Test that the dataset has 7 columns
test_that("dataset has 7 columns", {
  expect_equal(ncol(data), 7)
})

# Test that the 'DIVISION' column is character type
test_that("'DIVISION' is character", {
  expect_type(data$DIVISION, "character")
})

# Test that the 'NEIGHBORHOOD' column is character type
test_that("'NEIGHBORHOOD' is character", {
  expect_type(data$NEIGHBORHOOD, "character")
})

# Test that the 'HOMICIDE_TYPE' column is character type
test_that("'HOMICIDE_TYPE' is character", {
  expect_type(data$HOMICIDE_TYPE, "character")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(data)))
})

# Test that 'Division' contains only valid divisions.
valid_divisions <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", "D33",
               "D41", "D42", "D43", "D51", "D52", "D53", "D54", "D55")

test_that("'DIVISION' contains valid Police divisions", {
  expect_true(all(data$DIVISION %in% valid_divisions))
})

# Test that 'Division' contains only valid divisions.
valid_months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
                     "Oct", "Nov", "Dec")

test_that("'MONTH' contains valid months", {
  expect_true(all(data$MONTH %in% valid_months))
})

# Test that there are no empty strings in 'DIVISION', 'NEIGHBORHOOD', or 'HOMICIDE_TYPE' columns
test_that("no empty strings in 'division', 'DIVISION', or 'NEIGHBORHOOD' HOMICIDE_TYPE", {
  expect_false(any(data$DIVISION == "" | data$NEIGHBORHOOD == "" | data$HOMICIDE_TYPE == ""))
})