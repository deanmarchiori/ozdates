library(readr)
library(tidyverse)
library(stringr)
library(usethis)
library(lubridate)
library(janitor)


# raw data import ---------------------------------------------------------

#' Data sourced from https://search.data.gov.au/dataset/ds-dga-b1bc6077-dadd-4f61-9f8c-002ab2cdff10/details?q=public%20holidays
#' Available at: 2019-01-08


#### Australian Public Holidays 2019
# Source: https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/bda4d4f2-7fde-4bfc-8a23-a6eefc8cef80/download/australian_public_holidays_2019.csv

if (!file.exists("data-raw/auspubhols_2019.csv")) {
  download.file("https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/bda4d4f2-7fde-4bfc-8a23-a6eefc8cef80/download/australian_public_holidays_2019.csv", "data-raw/auspubhols_2019.csv")
}

raw_2019 <- readr::read_csv('data-raw/auspubhols_2019.csv')


### Australian Public Holidays 2017-18
# Source: https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/253d63c0-af1f-4f4c-b8d5-eb9d9b1d46ab/download/australianpublicholidays-201718.csv

if (!file.exists("data-raw/auspubhols_2017-2018.csv")) {
  download.file("https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/253d63c0-af1f-4f4c-b8d5-eb9d9b1d46ab/download/australianpublicholidays-201718.csv", "data-raw/auspubhols_2017-2018.csv")
}

raw_20172018 <- readr::read_csv('data-raw/auspubhols_2017-2018.csv')


### Australian Public Holidays 2016-17
# Source: https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/a24ecaf2-044a-4e66-989c-eacc81ded62f/download/australianpublicholidays-201617.csv

if (!file.exists("data-raw/auspubhols_2016-2017.csv")) {
  download.file("https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/a24ecaf2-044a-4e66-989c-eacc81ded62f/download/australianpublicholidays-201617.csv", "data-raw/auspubhols_2016-2017.csv")
}

raw_20162017 <- readr::read_csv('data-raw/auspubhols_2016-2017.csv')


### Australian Public Holidays 2015-16
# Source: https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/13ca6df3-f6c9-42a1-bb20-6e2c12fe9d94/download/australianpublicholidays-201516.csv

if (!file.exists("data-raw/auspubhols_2015-2016.csv")) {
  download.file("https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/13ca6df3-f6c9-42a1-bb20-6e2c12fe9d94/download/australianpublicholidays-201516.csv", "data-raw/auspubhols_2015-2016.csv")
}

raw_20152016 <- readr::read_csv('data-raw/auspubhols_2015-2016.csv')


### Australian Public Holidays 2014-15
# Source: https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/56a5ee91-8e94-416e-81f7-3fe626958f7e/download/australianpublicholidays-201415.csv-australianpublicholidays.csv.csv

if (!file.exists("data-raw/auspubhols_2014-2015.csv")) {
  download.file("https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/56a5ee91-8e94-416e-81f7-3fe626958f7e/download/australianpublicholidays-201415.csv-australianpublicholidays.csv.csv", "data-raw/auspubhols_2014-2015.csv")
}

raw_20142015 <- readr::read_csv('data-raw/auspubhols_2014-2015.csv')



# pre-process -------------------------------------------------------------

aus_public_holidays <- raw_2019 %>%
  select(-`Raw Date`, `Applicable To` = Jurisdiction) %>%
  rbind(raw_20172018, raw_20162017, raw_20152016, raw_20142015) %>%
  mutate(`Applicable To` = ifelse(`Applicable To` == "NAT", "ACT|NSW|NT|QLD|TAS|VIC|WA|SA", `Applicable To`),
         `Applicable To` = toupper(`Applicable To`)) %>%
  separate(`Applicable To`, into = paste0("state", 1:8), sep = "\\|", fill = "right") %>%
  gather(idx, jurisdiction, paste0("state", 1:8), na.rm = TRUE) %>%
  select(-idx) %>%
  unique() %>%
  mutate(Date = lubridate::ymd(Date)) %>%
  janitor::clean_names()


# save --------------------------------------------------------------------

write_csv(aus_public_holidays, "data-raw/aus_public_holidays.csv")
usethis::use_data(aus_public_holidays, overwrite = TRUE, compress = 'xz')
