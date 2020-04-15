
library(here)
library(ggplot2)
library(tidyr)
library(dplyr)
library(wesanderson)
library(viridis)
library(grid)
library(gridExtra)
library(ggpubr)
library(sf)


NH <-  st_read(here(
  "NH_gis/nonitpb_NH.shp"))

HERT <-  st_read(here(
  "HERT_gis/nonitpb_HERT.shp"))

HAL <-  st_read(here(
  "HAL_gis/nonitpb_HAL.shp"))

colnames(NH)

colnames(HERT)

colnames(HAL)

#cut out accessory colnames 

HAL2 <- HAL[ -c(90:91) ]


HERT2 <- HERT[-c(92:93)]


together <- rbind(NH,HAL2,HERT2)


write_sf(together, here("all3counties.shp"))


#joining the .csv to the together shapefile 


all <- st_read(here('all3counties.shp'))


#read in the csv for demo data 

csv <- read.csv(here("FINAL_csv_Master Spring 2020 Capstone Spreadsheet (2).csv"))

csv2 <- csv %>%
  select(-c(Student))

total <- merge(all,csv,by="Match_addr")

total2 <- total %>%
  select(-c(Student))





write_sf(total, here("allcountiesalldata.shp"))


