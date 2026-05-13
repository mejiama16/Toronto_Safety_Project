#### Preamble ####
# Purpose: Cleans the raw data obtained from OpenData Toronto.
# Author: Mariana Garcia Mejia
# Date: 08 May 2026.
# Contact: mariana.garcia@mail utoronto.ca
# License: MIT
# Pre-requisites: Package `tidyverse` must be installed.

#### Workspace setup ####
library(tidyverse)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  select(Event_Unique_Id, Occurrence_year, Occurrence_Date, 
         Division, Homicide_Type, Neighbourhood) |>
  filter(Occurrence_year >= 2011) |> 
  mutate(Occurrence_Month = month(ymd(Occurrence_Date), label=TRUE)) |>
  rename(
    ID = Event_Unique_Id,
    YEAR = Occurrence_year,
    DATE = Occurrence_Date,
    DIVISION = Division,
    HOMICIDE_TYPE = Homicide_Type,
    NEIGHBORHOOD = Neighbourhood,
    MONTH = Occurrence_Month
  ) |>
  mutate(YEAR = as.factor(YEAR),
         DIVISION = if_else(DIVISION == "D54", "D55", DIVISION) # division 54 is now division 55
  )


glimpse(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")
write_csv(cleaned_data, "paper/analysis_data.csv")
