library(tidyverse)
library(tidytuesdayR)
library(dplyr)
library(stringr)

tt <- tt_load("2020-09-22")



# country origin

origin_country <- tt$members %>%
  mutate(simple_country = strsplit(citizenship, "[/]")[[1]][1])
  

origin_country <- tt$members %>%
  mutate(simple_country = word(citizenship,1,sep="\\/")) %>%
  count(simple_country)

origin_country[origin_country$simple_country=="Czech Republic	", "n"] <- 1009
origin_country[26, 2] <- 1009

origin_country <- origin_country[-27,]

origin_country[41,2] <- 2020
origin_country <- origin_country[-42,]

origin_country[54,2] <- 14
origin_country <- origin_country[-53,]

origin_country[35,2] <- 3457
origin_country <- origin_country[-114,]

origin_country[85,2] <- 1608
origin_country <- origin_country[-110,]

origin_country[15,2] <- 516
origin_country <- origin_country[-113,]

origin_country <- origin_country[-113,]

write.csv(origin_country, "origin-country.csv")


# Summit date
summit_date_expeditions <- tt$expeditions %>%
  filter(peak_name == "Everest", termination_reason == "Success (main peak)") %>%
  count(year, highpoint_date)

expeditions <- read.csv("exped.csv")
summit_date_climbers <- expeditions %>%
  filter(peakid == "EVER", termination_reason == 1, year >= 1970) %>%
  mutate(summit_climbers= summit_members+summit_hired) %>%
  mutate(summit_date = as.Date(summit_date, "%m/%d/%y")) %>%
  complete(summit_date = seq.Date(min(summit_date), max(summit_date), by="day")) %>%
  mutate(month_day = format(as.Date(summit_date), "%m%d")) %>%
  filter(between(month_day, 0428, 0607)) %>% 
  group_by(summit_date) %>%
  summarise(summit_climbers = sum(summit_climbers)) %>%
  mutate(summit_climbers_NA = summit_climbers)
summit_date_climbers$summit_climbers[is.na(summit_date_climbers$summit_climbers)] <- 0
write.csv(summit_date_climbers, "summit_date_climbers_filter.csv", row.names = FALSE)

# Number of summitters
summit_counts_year <- expeditions %>%
  filter(peakid == "EVER", termination_reason == 1, year >= 1970) %>%
  mutate(summit_climbers= summit_members+summit_hired) %>%
  group_by(year) %>%
  summarise(summit_climbers = sum(summit_climbers))

write.csv(summit_counts_year, "summit_counts_year.csv", row.names = FALSE)

# mutate(month_day = format(as.Date(summit_date), "%m/%d")) %>%