library(tidyverse)
library(tidytuesdayR)
library(dplyr)
library(stringr)
library(lubridate)
library(withr)
tt <- tt_load("2020-09-22")



# country origin

origin_country <- tt$members %>%
  mutate(simple_country = strsplit(citizenship, "[/]")[[1]][1])
  

origin_country <- tt$members %>%
  filter(hired == FALSE) %>%
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

# Time of day
time_of_day <- expeditions%>%
  filter(peakid == "EVER", termination_reason == 1, year >= 1990) %>%
  drop_na(summit_time) %>%
  mutate(summit_climbers= summit_members+summit_hired) %>%
  mutate(summit_time = with_options(
    c(scipen = 999), 
    str_pad(summit_time, 4, pad = "0")
  )) %>%
  mutate(summit_hour = hour(as.POSIXct(strptime(summit_time, "%H%M")))) %>%
  group_by(year) %>%
  complete(summit_hour = seq(0, 23, by=1)) %>%
  group_by(summit_hour, year) %>%
  summarise(summit_climbers = sum(summit_climbers))
time_of_day$summit_climbers[is.na(time_of_day$summit_climbers)] <- 0

time_of_day <- time_of_day %>%
  mutate(range = cut(year, breaks=c(1990, 1999, 2009, 2020), labels = c("1990-1999", "2000-2009", "2010-2020"), include.lowest = TRUE)) %>%
  group_by(range, summit_hour) %>%
  summarise(summit_climbers = mean(summit_climbers))

write.csv(time_of_day, "average_time_day.csv")


time_of_day <- expeditions%>%
  filter(peakid == "EVER", termination_reason == 1, year >= 1970) %>%
  drop_na(summit_time) %>%
  mutate(summit_climbers= summit_members+summit_hired) %>%
  mutate(summit_time = with_options(
    c(scipen = 999), 
    str_pad(summit_time, 4, pad = "0")
  )) %>%
  group_by(summit_time, year) %>%
  summarise(summit_climbers = sum(summit_climbers))

write.csv(time_of_day, "time-day.csv", row.names = FALSE)
#  aggregate(summit)
#count(summit_hour, year)
#
#  group_by(summit_hour, year) %>%
#  summarise(mean_summit_hour = mean(summ))
#  aggregate(by=list(summit_hour, year), FUN="mean")

# route analysis
routes <- expeditions %>%
  filter(peakid == "EVER", termination_reason == 1) %>%
  filter(route1 == "S Col-SE Ridge" | route1 == "N Col-NE Ridge" ) %>%
  mutate(summit_climbers= summit_members+summit_hired) %>%
  group_by(route1) %>%
  summarise(summit_climbers=sum(summit_climbers))

everest <- expeditions %>%
  filter(peakid == "EVER", termination_reason == 1) %>%
  mutate(summit_climbers= summit_members+summit_hired)
sum(everest$summit_climbers)

# Age
age <- tt$members %>%
  drop_na(age) %>%
  filter(peak_id == "EVER", year >=1980, success == TRUE) %>%
  mutate(
    age_group = case_when(
      age <35 ~ "<35",
      age <=50 & age >= 35 ~ "35-50",
      age > 50 ~ ">50"
    )
  ) %>%
  count(year, age_group)

write.csv(age, "age_group.csv")
  





