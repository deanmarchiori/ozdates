library(tidyverse)
library(usethis)


# Source: https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/bda4d4f2-7fde-4bfc-8a23-a6eefc8cef80/download/australian_public_holidays_2019.csv
if (!file.exists("data-raw/auspubhols_2019.csv")) {
  download.file("https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10/resource/bda4d4f2-7fde-4bfc-8a23-a6eefc8cef80/download/australian_public_holidays_2019.csv", "data-raw/auspubhols_2019.csv")
}

raw <- readr::read_csv('data-raw/auspubhols_2019.csv')

# pre processing
auspubhols_2019 <- raw

write_csv(auspubhols_2019, "data-raw/auspubhols_2019.csv")

usethis::use_data(auspubhols_2019, overwrite = TRUE, compress = 'xz')
