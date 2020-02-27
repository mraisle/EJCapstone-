library(tmaptools)
library(ggplot2)
library(here)
library(dplyr)
library(plotly)
library(wesanderson)



#first let's read in the data 

all <- read.csv(here("geocoded_csv/justvariables_all.csv"))


#ok so we know that 0 is above detect and 1 is below detect 

all$Arsenic_Iod == 1

sum(all$Arsenic_Iod == 1, na.rm=TRUE)
