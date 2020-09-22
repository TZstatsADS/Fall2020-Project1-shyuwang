###### This R file is used to extract relevent variables #####
###### from ANES Time Series 2016 for analysis           #####

library(tidyverse)
library(haven)

anes_dat_2016 <- read_sav("../data/anes_timeseries_2016.sav")
use_dat <- anes_dat_2016 %>%
  transmute(mode = as_factor(V160501),
            pre_post = as_factor(V160502),
            state = as_factor(V161010d),
            feeling_dem_can = V161086,
            feeling_rep_can = V161087,
            feeling_obama = V161092,
            feeling_clinton = V161093,
            feeling_dem_party = V161095,
            feeling_rep_party = V161096,
            affect_dem_can_angry = as_factor(V161116),
            affect_dem_can_hopeful = as_factor(V161117),
            affect_dem_can_afraid = as_factor(V161118),
            affect_dem_can_proud = as_factor(V161119),
            affect_dem_can_disgusted = as_factor(V161120),
            affect_rep_can_angry = as_factor(V161121),
            affect_rep_can_hopeful = as_factor(V161122),
            affect_rep_can_afraid = as_factor(V161123),
            affect_rep_can_proud = as_factor(V161124),
            affect_rep_can_disgusted = as_factor(V161125),
            affect_obama_angry = as_factor(V161236),
            affect_obama_proud = as_factor(V161237),
            race = as_factor(V161310x),
            gay_marriage = as_factor(V161231),
            abortion = as_factor(V161232),
            death_penalty = as_factor(V161233),
            eco_since08 = as_factor(V161235x),
            vote_pres = as_factor(V162062x),
            turnout = as_factor(V162065x)
  )

# factor level transformation
levels(use_dat$affect_obama_angry)[c(1,2)] <- c("Refused", "DK")
levels(use_dat$vote_pres) <- c("Refused","DK","Missing","INAP","Hillary Clinton",
                               "Donald Trump","Gary Johnson","Jill Stein","Other")
levels(use_dat$race)=c("Missing","Missing","White","Black","Asian, native Hawaiian or other Pacif Islr","Native American or Alaska Native","Hispanic","Other non-Hispanic")

levels(use_dat$abortion)[c(1,2)] <- c("Refused","DK")


save(use_dat, file="../output/use_dat.RData")










