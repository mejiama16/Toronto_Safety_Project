#### Preamble ####
# Purpose: Cleans the raw additional data obtained from OpenData Toronto.
# Author: Mariana Garcia Mejia
# Date: 08 May 2026.
# Contact: mariana.garcia@mail utoronto.ca
# License: MIT
# Pre-requisites: Package `tidyverse` must be installed.

#### Workspace setup ####
library(tidyverse)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/additional_data.csv")

head(raw_data)

cleaned_data <-
  raw_data |>
  select(YEAR, DIVISION, 
         GROSS_EXPENDITURE__FINAL_) |>
  rename(
    EXPENDITURE = GROSS_EXPENDITURE__FINAL_,
  ) |>
  mutate(YEAR = as.factor(YEAR),
         DIVISION = gsub("Division ", "D", DIVISION),
         EXPENDITURE = as.numeric(gsub("[$,]", "", EXPENDITURE))) |>
  arrange(YEAR, DIVISION)


head(cleaned_data, 20)

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/additional_data.csv")
write_csv(cleaned_data, "paper/additional_data.csv")