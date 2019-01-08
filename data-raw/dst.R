### Preprocess Daylight Savings Time history

library(tidyverse)
library(lubridate)

# Import ------------------------------------------------------------------

# Source: http://www.bom.gov.au/climate/averages/tables/dst_times.shtml
dst_raw <- readr::read_csv("data-raw/dst.csv")

aus_daylight_saving <- dst_raw %>%
  select(state = `State(s) and territories affected`,
         dst_start_date = `Starting date`,
         dst_finish_date = `Finishing date`) %>%
  mutate(state = toupper(state),
         dst_start_date  = lubridate::dmy(dst_start_date),
         dst_finish_date = lubridate::dmy(dst_finish_date)) %>%
  separate(col = state, into = paste0("state", 1:6), sep = "\\,", fill = "right") %>%
  gather(idx, state, paste0("state", 1:6), na.rm = TRUE) %>%
  mutate(season_start = lubridate::year(dst_start_date)) %>%
  select(season_start, state, dst_start_date, dst_finish_date) %>%
  arrange(dst_start_date)


# save --------------------------------------------------------------------
write_csv(aus_daylight_saving, "data-raw/aus_daylight_saving.csv")
usethis::use_data(aus_daylight_saving, overwrite = TRUE, compress = 'xz')
