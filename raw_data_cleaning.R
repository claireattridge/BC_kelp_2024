## Cleaning raw data files
## Project: BC kelp 2024
## Author: Claire Attridge
## Origin: October 2024


## Loading packages
library(tidyverse)


##### Reading in the raw dataframes ----

## Understory kelps
understory <- read_csv("./Data_raw/quadrat_kelps_understory.csv")

## Canopy kelps
canopy <- read_csv("./Data_raw/quadrat_kelps_canopy.csv")
canopy_collected <- 

## Invertebrates
invert_ab <- read_csv("./Data_raw/quadrat_invertebrates_abundance.csv")
invert_size <- read_csv("./Data_raw/quadrat_invertebrates_sized.csv")

## Abiotic
substrate <- read_csv("./Data_raw/quadrat_substrate.csv")

## Metadata
metadata <- read_csv("./Data_raw/quadrat_metadata.csv")


##### Cleaning understory kelp (quadrat) dataframe ----


## Adding in survey metadata
understory_md <- understory %>%
  left_join(metadata, by = "survey_id") %>%
  as.data.frame() %>%
  mutate(quadrat = as.factor(quadrat), observer = as.factor(observer))


## Editing the quadrat ID column
## Labels 1-10 total instead of labels 1-5 / diver
understory_edit <- understory_md %>%
  mutate(quadrat = case_when(observer == "CMA" & quadrat == "1" ~ "6",
                             observer == "CMA" & quadrat == "2" ~ "7",
                             observer == "CMA" & quadrat == "3" ~ "8",
                             observer == "CMA" & quadrat == "4" ~ "9",
                             observer == "CMA" & quadrat == "5" ~ "10",
                             observer == "AEA" & quadrat == "1" ~ "1",
                             observer == "AEA" & quadrat == "2" ~ "2",
                             observer == "AEA" & quadrat == "3" ~ "3",
                             observer == "AEA" & quadrat == "4" ~ "4",
                             observer == "AEA" & quadrat == "5" ~ "5",))


## Adding a region ID column
understory_reg <- understory_edit %>%
  mutate(reg_id = case_when(region == "Sooke" ~ "1",
                            region == "Nanaimo" ~ "2",
                            region == "Quadra" ~ "3",
                            region == "Broughton Archipelago" ~ "4",
                            region == "Bella Bella" ~ "5",
                            region == "Haida Gwaii" ~ "6")) %>%
  mutate(reg_id = as.numeric(reg_id))


## Removing excess columns
understory_select <- understory_reg %>%
  select(-c(survey_id, observer, bryozoan_cover, diver_1, diver_2, notes))


## Exporting clean .csv to folder
write.csv(understory_select,
          "./Data_manipulated/quadrat_understory_cleaned.csv",
          row.names = F)


##### Cleaning canopy kelp (quadrat) dataframe ----

## Adding in survey metadata
canopy_md <- canopy %>%
  left_join(metadata, by = "survey_id") %>%
  as.data.frame() %>%
  mutate(quadrat = as.factor(quadrat), observer = as.factor(observer))

##### Cleaning canopy kelp (collected) dataframe ----

##### Cleaning substrate dataframe ----


## Adding in survey metadata
substrate_md <- substrate %>%
  left_join(metadata, by = "survey_id") %>%
  as.data.frame()


## Editing the quadrat ID column
## Labels 1-10 instead of labels 1-5 / diver
substrate_edit <- substrate_md %>%
  mutate(quadrat = case_when(observer == "CMA" & quadrat == "1" ~ "6",
                             observer == "CMA" & quadrat == "2" ~ "7",
                             observer == "CMA" & quadrat == "3" ~ "8",
                             observer == "CMA" & quadrat == "4" ~ "9",
                             observer == "CMA" & quadrat == "5" ~ "10",
                             observer == "AEA" & quadrat == "1" ~ "1",
                             observer == "AEA" & quadrat == "2" ~ "2",
                             observer == "AEA" & quadrat == "3" ~ "3",
                             observer == "AEA" & quadrat == "4" ~ "4",
                             observer == "AEA" & quadrat == "5" ~ "5",))


## Adding a region ID column
substrate_reg <- substrate_edit %>%
  mutate(reg_id = case_when(region == "Sooke" ~ "1",
                            region == "Nanaimo" ~ "2",
                            region == "Quadra" ~ "3",
                            region == "Broughton Archipelago" ~ "4",
                            region == "Bella Bella" ~ "5",
                            region == "Haida Gwaii" ~ "6")) %>%
  mutate(reg_id = as.numeric(reg_id))


## Removing excess columns
substrate_select <- substrate_reg %>%
  select(-c(survey_id, observer, diver_1, diver_2, notes))


## Exporting clean .csv to folder
write.csv(substrate_select,
          "./Data_manipulated/quadrat_substrate_cleaned.csv",
          row.names = F)
