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